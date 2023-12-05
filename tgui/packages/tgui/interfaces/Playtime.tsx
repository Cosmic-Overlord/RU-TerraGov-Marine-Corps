import { useBackend, useLocalState } from '../backend';
import { Section, Tabs, Stack, ProgressBar, AnimatedNumber, Box } from '../components';
import { Window } from '../layouts';

type PlaytimeData = {
  categories: Category[];
  totalTime: number;
  totalTimeAlive: number;
  totalTimeDead: number;
  timeAdmin: number;
};

type Category = {
  name: string;
  theme: string;
  roles: Role[];
};

type Role = {
  name: string;
  time: number;
  icon: string;
};

export const Playtime = (props, context) => {
  const { act, data } = useBackend<PlaytimeData>(context);
  const { categories, totalTime, totalTimeAlive, totalTimeDead, timeAdmin } =
    data;

  categories.sort((a, b) => {
    if (a.name === 'Unassigned') return 1;
    if (b.name === 'Unassigned') return -1;
    if (a.name.toLowerCase() > b.name.toLowerCase()) return 1;
    if (a.name.toLowerCase() < b.name.toLowerCase()) return -1;
    return 0;
  });

  categories.map((category) => {
    return category.roles.sort((a, b) => {
      if (a.time > b.time) return -1;
      if (a.time < b.time) return 1;
      if (a.name.toLowerCase() > b.name.toLowerCase()) return 1;
      if (a.name.toLowerCase() < b.name.toLowerCase()) return -1;
      return 0;
    });
  });

  const [selectedCategory, setSelectedCategory] = useLocalState(
    context,
    'selectedCategory',
    categories.length ? categories[0] : null
  );

  return (
    <Window width={500} height={800} theme={selectedCategory?.theme}>
      <Window.Content>
        <Stack fill vertical>
          <Stack.Item>
            <Section
              title={`Total Playtime: ${parseFloat(
                (totalTime / 60).toFixed(1)
              )}hrs`}
              fontSize={2}
              bold>
              <Stack vertical>
                <Stack.Item>
                  <Stack>
                    <Box width="50%" minWidth={6} mr={10} textColor={'green'}>
                      Alive
                    </Box>
                    :
                    <ProgressBar value={totalTimeAlive / totalTime} ml={1.5}>
                      {
                        <AnimatedNumber
                          value={parseFloat((totalTimeAlive / 60).toFixed(1))}
                        />
                      }
                      hrs
                    </ProgressBar>
                  </Stack>
                </Stack.Item>
                <Stack.Item>
                  <Stack>
                    <Box width="50%" minWidth={6} mr={10} textColor={'red'}>
                      Dead
                    </Box>
                    :
                    <ProgressBar value={totalTimeDead / totalTime} ml={1.5}>
                      {
                        <AnimatedNumber
                          value={parseFloat((totalTimeDead / 60).toFixed(1))}
                        />
                      }
                      hrs
                    </ProgressBar>
                  </Stack>
                </Stack.Item>
                {timeAdmin > 0 && (
                  <Stack.Item>
                    <Stack>
                      <Box width="50%" minWidth={6} mr={10}>
                        Admin
                      </Box>
                      :
                      <ProgressBar value={timeAdmin / totalTime} ml={1.5}>
                        {
                          <AnimatedNumber
                            value={parseFloat((timeAdmin / 60).toFixed(1))}
                          />
                        }
                        hrs
                      </ProgressBar>
                    </Stack>
                  </Stack.Item>
                )}
              </Stack>
            </Section>
          </Stack.Item>
          {categories.length > 0 && (
            <Stack.Item>
              <Section title="Category" lineHeight={1.75} textAlign="center">
                <Tabs>
                  <Stack wrap="wrap">
                    {categories.map((category) => {
                      return (
                        <Stack.Item
                          m={0.5}
                          grow={category.name.length}
                          basis={'content'}
                          key={category.name}>
                          <Tabs.Tab
                            selected={selectedCategory === category}
                            onClick={() => setSelectedCategory(category)}>
                            {category.name}
                          </Tabs.Tab>
                        </Stack.Item>
                      );
                    })}
                  </Stack>
                </Tabs>
              </Section>
            </Stack.Item>
          )}
          {selectedCategory && (
            <Stack.Item grow>
              <Section title="Roles" bold fill scrollable>
                <Stack vertical>
                  {selectedCategory.roles.map((role) => {
                    return (
                      <Stack.Item key={role.name} m={1.5}>
                        <Stack>
                          <Box
                            key={role.name}
                            as="img"
                            src={`data:image/jpeg;base64,${role.icon}`}
                            height={1}
                            style={{
                              transform: 'scale(2)',
                              '-ms-interpolation-mode': 'nearest-neighbor',
                            }}
                          />
                          <Box width="50%" minWidth={10} ml={3} mr={3}>
                            {role.name}
                          </Box>
                          :
                          <ProgressBar
                            value={role.time / totalTimeAlive}
                            height={1.5}
                            ml={1.5}>
                            {
                              <AnimatedNumber
                                value={parseFloat((role.time / 60).toFixed(1))}
                              />
                            }
                            hrs
                          </ProgressBar>
                        </Stack>
                      </Stack.Item>
                    );
                  })}
                </Stack>
              </Section>
            </Stack.Item>
          )}
        </Stack>
      </Window.Content>
    </Window>
  );
};
