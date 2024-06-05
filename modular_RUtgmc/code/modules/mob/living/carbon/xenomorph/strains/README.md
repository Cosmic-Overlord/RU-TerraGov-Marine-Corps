# Создание стрейнов

Создание стрейнов схоже с созданием нового ксеноморфа за некоторыми исключениями:

В датуме И у самого моба стрейна должно быть указано:

```
is_strain = TRUE
```

caste_parent_type_path должен ссылаться на тип касты, из которой эволюционирует стрейн:

```
caste_parent_type_path = /mob/living/carbon/xenomorph/parent_xeno
```

caste_flags должен содержать теги CASTE_HIDE_IN_STATUS и CASTE_INSTANT_EVOLUTION

```
caste_flags = CASTE_HIDE_IN_STATUS|CASTE_INSTANT_EVOLUTION
```

У касты должны быть указаны стрейны в которые она может эволюционировать.

```
strains_to = list(
	/mob/living/carbon/xenomorph/new_strain,
)
```
