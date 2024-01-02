import { BooleanLike, classes } from 'common/react';

import { useBackend } from '../backend';
import { Button, Flex, Table } from '../components';
import { Window } from '../layouts';

type AlternateAction = {
  icon?: string;
  text: string;
};

const ALTERNATE_ACTIONS: Record<string, AlternateAction> = {
  adjust_sensors: {
    text: 'Adjust suit sensors',
  },
  loosen_strap: {
    text: 'Loosen strap',
  },
  tighten_strap: {
    text: 'Tighten strap',
  },
};

enum ObscuringLevel {
  Completely = 1,
  Hidden = 2,
}

type Interactable = {
  interacting: BooleanLike;
};

type Unavailable = {
  unavailable: BooleanLike;
};

const SLOTS: Record<string, string> = {
  left_hand: 'Left hand',
  right_hand: 'Right hand',
  back: 'Backpack',
  head: 'Headwear',
  mask: 'Mask',
  neck: 'Neckwear',
  parrot_headset: 'Headset',
  eyes: 'Eyewear',
  ears: 'Earwear',
  suit: 'Suit',
  suit_storage: 'Suit storage',
  shoes: 'Shoes',
  gloves: 'Gloves',
  uniform: 'Uniform',
  belt: 'Belt',
  left_pocket: 'Left pocket',
  right_pocket: 'Right pocket',
  id: 'ID',
  handcuffs: 'Handcuffs',
};

type Layout = Array<
  Array<{
    id: string;
    indented?: BooleanLike;
  }>
>;

const DEFAULT_LAYOUT: Layout = [
  [
    {
      id: 'left_hand',
    },
    {
      id: 'right_hand',
    },
  ],
  [
    {
      id: 'back',
    },
  ],
  [
    {
      id: 'head',
    },
    {
      id: 'mask',
    },
    {
      id: 'parrot_headset',
    },
    {
      id: 'eyes',
    },
    {
      id: 'ears',
    },
  ],
  [
    {
      id: 'suit',
    },
    {
      id: 'suit_storage',
    },
    {
      id: 'shoes',
    },
    {
      id: 'gloves',
    },
    {
      id: 'uniform',
    },
    {
      id: 'belt',
    },
    {
      id: 'left_pocket',
    },
    {
      id: 'right_pocket',
    },
    {
      id: 'id',
    },
    {
      id: 'handcuffs',
    },
  ],
];

/**
 * Some possible options:
 *
 * null - No interactions, no item, but is an available slot
 * { interacting: 1 } - No item, but we're interacting with it
 * { icon: icon, name: name } - An item with no alternate actions
 *   that we're not interacting with.
 * { icon, name, interacting: 1 } - An item with no alternate actions
 *   that we're interacting with.
 */
type StripMenuItem =
  | null
  | Interactable
  | Unavailable
  | ((
      | {
          icon?: string;
          name: string;
          alternate?: string;
        }
      | {
          obscured: ObscuringLevel;
        }
    ) &
      Partial<Interactable> &
      Partial<Unavailable>);

type StripMenuData = {
  items: Record<keyof typeof SLOTS, StripMenuItem>;
  layout?: Layout;
  name: string;
};

// Internal data structure used for props
interface StripMenuRowProps {
  slotName: string;
  itemName?: string | false;
  slotID: string;

  alternates?: AlternateAction[];

  interacting: BooleanLike;
  indented: BooleanLike;
  obscured: ObscuringLevel;
  empty: BooleanLike;
  unavailable: BooleanLike;
}

const StripMenuRow = (props: StripMenuRowProps) => {
  const { act, data } = useBackend<StripMenuData>();

  const name = props.obscured
    ? 'Obscured'
    : props.empty
      ? 'Empty'
      : props.itemName;

  return (
    <Table.Row
      className={classes([
        props.indented && 'indented',
        props.obscured === ObscuringLevel.Completely && 'obscured-complete',
        props.obscured === ObscuringLevel.Hidden && 'obscured-hidden',
        props.unavailable && 'unavailable',
        props.empty && 'empty',
      ])}
    >
      <Table.Cell pl={1.5}>{props.slotName}:</Table.Cell>
      <Table.Cell pr={1.5} position="relative">
        <Flex direction="column">
          {!props.unavailable && (
            <Flex.Item>
              <Button
                compact
                content={name}
                disabled={props.obscured === ObscuringLevel.Completely}
                color={props.empty ? 'transparent' : null}
                ellipsis
                maxWidth="100%"
                icon={props.interacting && 'spinner'}
                iconSpin
                onClick={() => act('use', { key: props.slotID })}
              />
            </Flex.Item>
          )}
          {props.alternates?.map((alternate) => (
            <Flex.Item key={alternate.text}>
              <Button
                compact
                content={alternate.text}
                onClick={() => act('alt', { key: props.slotID })}
              />
            </Flex.Item>
          ))}
        </Flex>
      </Table.Cell>
    </Table.Row>
  );
};

export const StripMenu = (props) => {
  const { act, data } = useBackend<StripMenuData>();

  const items = data.items;
  const layout = data.layout || DEFAULT_LAYOUT;

  const contents = layout.map((section) => {
    const rows = section
      .filter((slot) => items[slot.id] !== undefined)
      .map((slot) => {
        const item = items[slot.id];

        const alternate =
          item && 'alternate' in item && ALTERNATE_ACTIONS[item.alternate!];

        return (
          <StripMenuRow
            slotName={SLOTS[slot.id]}
            itemName={
              item && 'name' in item && item.name ? item.name : undefined
            }
            obscured={item && 'obscured' in item ? item.obscured : 0}
            indented={slot.indented}
            slotID={slot.id}
            unavailable={item && 'unavailable' in item && item.unavailable}
            alternates={alternate ? [alternate] : undefined}
            empty={!item || !('name' in item || 'obscured' in item)}
            interacting={item && 'interacting' in item && item.interacting}
            key={slot.id}
          />
        );
      });

    // If any valid slots were found in this section, add a spacer
    if (rows.length) {
      rows.push(
        <Table.Row className="spacer">
          <Table.Cell />
          <Table.Cell />
        </Table.Row>,
      );
    }

    return rows;
  });

  return (
    <Window title={`Stripping ${data.name}`} width={500} height={580}>
      <Window.Content scrollable fitted>
        <Table mt={1} className="strip-menu-table" fontSize="1.1em">
          {contents}
        </Table>
      </Window.Content>
    </Window>
  );
};
