import { useBackend } from '../backend';
import { Button, Section, Collapsible } from '../components';
import { Window } from '../layouts';

const CasteView = (props) => {
  // These are removed since every caste has them and its just clutter.
  const filteredAbilities = ['Rest', 'Regurgitate'];
  const abilities = Object.values(props.abilities).filter(
    (ability: XenoAbility) => filteredAbilities.indexOf(ability.name) === -1
  ) as XenoAbility[];

  return (
    <Section title={`${props.name} - Abilities`}>
      {props.abilities
        ? abilities.map((ability) => (
          <Button
            fluid={1}
            key={ability.name}
            color="transparent"
            tooltip={ability.desc}
            tooltipPosition={'bottom'}
            content={ability.name}
          />
        ))
        : 'This caste has no abilities'}
    </Section>
  );
};

export const HiveStrainScreen = (props, context) => {
  const { act, data } = useBackend(context);

  const { name, abilities, evolves_to, can_evolve } = data as ByondData;

  // Most checks are skipped for shrike and queen so we except them below.
  const evolvesInto = Object.values(evolves_to);

  return (
    <Window theme="xeno" title="Xenomorph Evolution" width={400} height={750}>
      <Window.Content scrollable>
        <Section title="Current Evolution">
          <CasteView act={act} current name={name} abilities={abilities} />
        </Section>
        <Section title="Available Evolutions">
          {evolvesInto.map((evolve, idx) => (
            <Collapsible
              key={evolve.type_path}
              title={`${evolve.name} (click for details)`}
              buttons={
                <Button
                  disabled={!evolve.instant_evolve}
                  onClick={() => act('evolve', { path: evolve.type_path })}>
                  Evolve
                </Button>
              }>
              <CasteView name={evolve.name} abilities={evolve.abilities} />
            </Collapsible>
          ))}
        </Section>
      </Window.Content>
    </Window>
  );
};

type ByondData = {
  name: string;
  abilities: XenoAbility[];
  evolves_to: EvolveCaste[];
  can_evolve: boolean;
};

type EvolveCaste = {
  type_path: string;
  name: string;
  abilities: XenoAbility[];
  instant_evolve: boolean;
};

type XenoAbility = {
  name: string;
  desc: string;
};
