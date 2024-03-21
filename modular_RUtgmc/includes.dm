#include "code\__HELPERS\text.dm"
#include "code\_globalvars\lists\flavor_misc.dm"
#include "code\_globalvars\lists\mapping.dm"
#include "code\_globalvars\lists\mobs.dm"
#include "code\_globalvars\lists\objects.dm"
#include "code\_onclick\xeno.dm"
#include "code\_onclick\hud\hud.dm"
#include "code\_onclick\hud\screen_objects\menu_text_objects.dm"
#include "code\_onclick\hud\screen_objects\screen_objects.dm"
#include "code\_onclick\hud\xeno\larva.dm"
#include "code\_onclick\hud\xeno\xeno.dm"
#include "code\controllers\configuration\entries\general.dm"
#include "code\controllers\subsystem\job.dm"
#include "code\controllers\subsystem\minimaps.dm"
#include "code\controllers\subsystem\points.dm"
#include "code\controllers\subsystem\processing\resinshaping.dm"
#include "code\datums\namepool.dm"
#include "code\datums\shuttles.dm"
#include "code\datums\skills.dm"
#include "code\datums\actions\ability_actions.dm"
#include "code\datums\actions\observer_action.dm"
#include "code\datums\actions\xeno_action.dm"
#include "code\datums\actions\actions\action.dm"
#include "code\datums\components\overlay_lighting.dm"
#include "code\datums\elements\shrapnel_removal.dm"
#include "code\datums\emergency_calls\necoarc.dm"
#include "code\datums\gamemodes\_game_mode.dm"
#include "code\datums\gamemodes\crash.dm"
#include "code\datums\gamemodes\distress.dm"
#include "code\datums\gamemodes\nuclear_war.dm"
#include "code\datums\greyscale\greyscale_configs.dm"
#include "code\datums\jobs\squads.dm"
#include "code\datums\jobs\job\clown.dm"
#include "code\datums\jobs\job\job_exp.dm"
#include "code\datums\jobs\job\marines.dm"
#include "code\datums\jobs\job\militarypolice.dm"
#include "code\datums\jobs\job\necoarc.dm"
#include "code\datums\jobs\job\shipside.dm"
#include "code\datums\jobs\job\sons_of_mars_shipside.dm"
#include "code\datums\jobs\job\xenomorph.dm"
#include "code\datums\keybinding\communication.dm"
#include "code\datums\keybinding\xeno.dm"
#include "code\datums\loadout\loadout_manager.dm"
#include "code\datums\loadout\item_representation\_item_representation.dm"
#include "code\datums\status_effects\debuffs.dm"
#include "code\datums\status_effects\xeno_buffs.dm"
#include "code\datums\looping_sounds\miscellaneous.dm"
#include "code\game\atoms.dm"
#include "code\game\buckling.dm"
#include "code\game\data_huds.dm"
#include "code\game\objects\area\gelide_iv.dm"
#include "code\game\objects\area\sulaco.dm"
#include "code\game\objects\effects\aliens.dm"
#include "code\game\objects\effects\overlays.dm"
#include "code\game\objects\effects\weeds.dm"
#include "code\game\objects\effects\effect_system\smoke.dm"
#include "code\game\objects\effects\landmarks\landmarks.dm"
#include "code\game\objects\effects\landmarks\marine_spawns.dm"
#include "code\game\objects\items\bodybag.dm"
#include "code\game\objects\items\defibrillator.dm"
#include "code\game\objects\items\items.dm"
#include "code\game\objects\items\misc.dm"
#include "code\game\objects\items\scanners.dm"
#include "code\game\objects\items\explosives\bombvest.dm"
#include "code\game\objects\items\explosives\marines.dm"
#include "code\game\objects\items\radio\headset.dm"
#include "code\game\objects\items\radio\intercom.dm"
#include "code\game\objects\items\reagent_containers\autoinjectors.dm"
#include "code\game\objects\items\reagent_containers\glass\bottle.dm"
#include "code\game\objects\items\robot\robot_parts.dm"
#include "code\game\objects\items\sheets\sheet_types.dm"
#include "code\game\objects\items\stacks\medical.dm"
#include "code\game\objects\items\storage\backpack.dm"
#include "code\game\objects\items\storage\belt.dm"
#include "code\game\objects\items\storage\boxes.dm"
#include "code\game\objects\items\storage\dispenser.dm"
#include "code\game\objects\items\storage\holsters.dm"
#include "code\game\objects\items\storage\surgical_tray.dm"
#include "code\game\objects\items\tools\cleaning_tools.dm"
#include "code\game\objects\items\tools\soldering_tool.dm"
#include "code\game\objects\items\tools\shovel_tools.dm"
#include "code\game\objects\items\tools\maintenance_tools.dm"
#include "code\game\objects\items\weapons\blades.dm"
#include "code\game\objects\items\weapons\harvester.dm"
#include "code\game\objects\machinery\adv_med.dm"
#include "code\game\objects\machinery\autodoc.dm"
#include "code\game\objects\machinery\bioprinter.dm"
#include "code\game\objects\machinery\iv_drip.dm"
#include "code\game\objects\machinery\miner.dm"
#include "code\game\objects\machinery\mortar.dm"
#include "code\game\objects\machinery\OpTable.dm"
#include "code\game\objects\machinery\sleeper.dm"
#include "code\game\objects\machinery\squad_manager.dm"
#include "code\game\objects\machinery\bots\roomba.dm"
#include "code\game\objects\machinery\camera\camera.dm"
#include "code\game\objects\machinery\cloning\cloning.dm"
#include "code\game\objects\machinery\doors\airlock.dm"
#include "code\game\objects\machinery\squad_supply\supply_beacon.dm"
#include "code\game\objects\machinery\vending\marine_vending.dm"
#include "code\game\objects\machinery\vending\new_marine_vendors.dm"
#include "code\game\objects\machinery\vending\vending_types.dm"
#include "code\game\objects\structures\barricade.dm"
#include "code\game\objects\structures\droppod.dm"
#include "code\game\objects\structures\ladders.dm"
#include "code\game\objects\structures\misc.dm"
#include "code\game\objects\structures\signs.dm"
#include "code\game\objects\structures\teleporter.dm"
#include "code\game\objects\structures\window_frame.dm"
#include "code\game\objects\structures\window.dm"
#include "code\game\objects\structures\xeno.dm"
#include "code\game\objects\structures\crates_lockers\closets.dm"
#include "code\game\objects\structures\crates_lockers\largecrate.dm"
#include "code\game\objects\structures\stool_bed_chair_nest\bed.dm"
#include "code\game\objects\structures\stool_bed_chair_nest\chairs.dm"
#include "code\game\objects\structures\stool_bed_chair_nest\xeno_nest.dm"
#include "code\game\objects\explosives\grenades\grenade.dm"
#include "code\game\turfs\closed.dm"
#include "code\game\turfs\floor_types.dm"
#include "code\game\turfs\liquid_turfs.dm"
#include "code\game\turfs\markings.dm"
#include "code\game\turfs\snow.dm"
#include "code\game\turfs\wall_types.dm"
#include "code\game\turfs\walls\resin.dm"
#include "code\game\turfs\walls\wall_types.dm"
#include "code\modules\admin\admin_verbs.dm"
#include "code\modules\admin\holder.dm"
#include "code\modules\admin\panels\player_panel.dm"
#include "code\modules\ai\presets\xeno_presets.dm"
#include "code\modules\atmospherics\machinery\components\unary_devices\vent_pump.dm"
#include "code\modules\atmospherics\machinery\components\unary_devices\vent_scrubber.dm"
#include "code\modules\atmospherics\machinery\pipes\pipes.dm"
#include "code\modules\client\preferences_gear.dm"
#include "code\modules\clothing\clothing.dm"
#include "code\modules\clothing\glasses\glasses.dm"
#include "code\modules\clothing\glasses\night.dm"
#include "code\modules\clothing\gloves\marine_gloves.dm"
#include "code\modules\clothing\head\collectable.dm"
#include "code\modules\clothing\head\head.dm"
#include "code\modules\clothing\head\helmet.dm"
#include "code\modules\clothing\head\jobs.dm"
#include "code\modules\clothing\head\misc.dm"
#include "code\modules\clothing\head\soft_caps.dm"
#include "code\modules\clothing\masks\gasmask.dm"
#include "code\modules\clothing\masks\miscellaneous.dm"
#include "code\modules\clothing\modular_armor\attachments.dm"
#include "code\modules\clothing\modular_armor\combat_robot.dm"
#include "code\modules\clothing\modular_armor\jaeger.dm"
#include "code\modules\clothing\modular_armor\mark_one.dm"
#include "code\modules\clothing\modular_armor\modular.dm"
#include "code\modules\clothing\modular_armor\som.dm"
#include "code\modules\clothing\modular_armor\style_line.dm"
#include "code\modules\clothing\modular_armor\xenonauten.dm"
#include "code\modules\clothing\modular_armor\attachments\cape.dm"
#include "code\modules\clothing\modular_armor\attachments\chest_plates.dm"
#include "code\modules\clothing\modular_armor\attachments\modules.dm"
#include "code\modules\clothing\modular_armor\attachments\storage.dm"
#include "code\modules\clothing\shoes\marine_shoes.dm"
#include "code\modules\clothing\suits\suits.dm"
#include "code\modules\clothing\under\marine_uniform.dm"
#include "code\modules\mob\living\living_defense.dm"
#include "code\modules\mob\living\living_verbs.dm"
#include "code\modules\mob\living\say.dm"
#include "code\modules\mob\living\status_procs.dm"
#include "code\modules\mob\living\carbon\human\emote.dm"
#include "code\modules\mob\living\carbon\human\human_defense.dm"
#include "code\modules\mob\living\carbon\human\human_defines.dm"
#include "code\modules\mob\living\carbon\human\human_species.dm"
#include "code\modules\mob\living\carbon\human\species.dm"
#include "code\modules\mob\living\carbon\human\zombie.dm"
#include "code\modules\mob\living\carbon\xenomorph\abilities.dm"
#include "code\modules\mob\living\carbon\xenomorph\attack_alien.dm"
#include "code\modules\mob\living\carbon\xenomorph\death.dm"
#include "code\modules\mob\living\carbon\xenomorph\egg.dm"
#include "code\modules\mob\living\carbon\xenomorph\embryo.dm"
#include "code\modules\mob\living\carbon\xenomorph\evolution.dm"
#include "code\modules\mob\living\carbon\xenomorph\facehuggers.dm"
#include "code\modules\mob\living\carbon\xenomorph\hive_datum.dm"
#include "code\modules\mob\living\carbon\xenomorph\hive_upgrades.dm"
#include "code\modules\mob\living\carbon\xenomorph\life.dm"
#include "code\modules\mob\living\carbon\xenomorph\xeno_defines.dm"
#include "code\modules\mob\living\carbon\xenomorph\xenoattacks.dm"
#include "code\modules\mob\living\carbon\xenomorph\xenomorph.dm"
#include "code\modules\mob\living\carbon\xenomorph\xenoprocs.dm"
#include "code\modules\mob\living\carbon\xenomorph\xenoupgrade.dm"
#include "code\modules\mob\living\carbon\xenomorph\castes\baneling\baneling.dm"
#include "code\modules\mob\living\carbon\xenomorph\castes\behemoth\castedatum_behemoth.dm"
#include "code\modules\mob\living\carbon\xenomorph\castes\behemoth\behemoth.dm"
#include "code\modules\mob\living\carbon\xenomorph\castes\boiler\abilities_boiler.dm"
#include "code\modules\mob\living\carbon\xenomorph\castes\boiler\castedatum_boiler.dm"
#include "code\modules\mob\living\carbon\xenomorph\castes\bull\bull.dm"
#include "code\modules\mob\living\carbon\xenomorph\castes\bull\castedatum_bull.dm"
#include "code\modules\mob\living\carbon\xenomorph\castes\carrier\abilities_carrier.dm"
#include "code\modules\mob\living\carbon\xenomorph\castes\carrier\carrier.dm"
#include "code\modules\mob\living\carbon\xenomorph\castes\carrier\castedatum_carrier.dm"
#include "code\modules\mob\living\carbon\xenomorph\castes\chimera\abilities_chimera.dm"
#include "code\modules\mob\living\carbon\xenomorph\castes\chimera\chimera.dm"
#include "code\modules\mob\living\carbon\xenomorph\castes\chimera\castedatum_chimera.dm"
#include "code\modules\mob\living\carbon\xenomorph\castes\crusher\abilities_crusher.dm"
#include "code\modules\mob\living\carbon\xenomorph\castes\crusher\castedatum_crusher.dm"
#include "code\modules\mob\living\carbon\xenomorph\castes\crusher\crusher.dm"
#include "code\modules\mob\living\carbon\xenomorph\castes\defender\abilities_defender.dm"
#include "code\modules\mob\living\carbon\xenomorph\castes\defender\castedatum_defender.dm"
#include "code\modules\mob\living\carbon\xenomorph\castes\defiler\abilities_defiler.dm"
#include "code\modules\mob\living\carbon\xenomorph\castes\defiler\castedatum_defiler.dm"
#include "code\modules\mob\living\carbon\xenomorph\castes\drone\drone.dm"
#include "code\modules\mob\living\carbon\xenomorph\castes\drone\castedatum_drone.dm"
#include "code\modules\mob\living\carbon\xenomorph\castes\facehugger\castedatum_facehugger.dm"
#include "code\modules\mob\living\carbon\xenomorph\castes\facehugger\facehugger.dm"
#include "code\modules\mob\living\carbon\xenomorph\castes\facehugger\abilities_facehugger.dm"
#include "code\modules\mob\living\carbon\xenomorph\castes\gorger\abilities_gorger.dm"
#include "code\modules\mob\living\carbon\xenomorph\castes\gorger\castedatum_gorger.dm"
#include "code\modules\mob\living\carbon\xenomorph\castes\hivelord\abilities_hivelord.dm"
#include "code\modules\mob\living\carbon\xenomorph\castes\hivemind\abilities_hivemind.dm"
#include "code\modules\mob\living\carbon\xenomorph\castes\hivemind\castedatum_hivemind.dm"
#include "code\modules\mob\living\carbon\xenomorph\castes\hivemind\hivemind.dm"
#include "code\modules\mob\living\carbon\xenomorph\castes\hunter\abilities_hunter.dm"
#include "code\modules\mob\living\carbon\xenomorph\castes\hunter\castedatum_hunter.dm"
#include "code\modules\mob\living\carbon\xenomorph\castes\king\abilities_king.dm"
#include "code\modules\mob\living\carbon\xenomorph\castes\king\castedatum_king.dm"
#include "code\modules\mob\living\carbon\xenomorph\castes\king\king.dm"
#include "code\modules\mob\living\carbon\xenomorph\castes\larva\larva.dm"
#include "code\modules\mob\living\carbon\xenomorph\castes\panther\castedatum_panther.dm"
#include "code\modules\mob\living\carbon\xenomorph\castes\panther\panther.dm"
#include "code\modules\mob\living\carbon\xenomorph\castes\panther\abilities_panther.dm"
#include "code\modules\mob\living\carbon\xenomorph\castes\praetorian\abilities_praetorian.dm"
#include "code\modules\mob\living\carbon\xenomorph\castes\praetorian\castedatum_praetorian.dm"
#include "code\modules\mob\living\carbon\xenomorph\castes\praetorian\praetorian.dm"
#include "code\modules\mob\living\carbon\xenomorph\castes\puppeteer\puppeteer.dm"
#include "code\modules\mob\living\carbon\xenomorph\castes\puppeteer\abilities_puppeteer.dm"
#include "code\modules\mob\living\carbon\xenomorph\castes\puppet\puppet.dm"
#include "code\modules\mob\living\carbon\xenomorph\castes\puppet\castedatum_puppet.dm"
// #include "code\modules\mob\living\carbon\xenomorph\castes\predalien\castedatum_predalien.dm"
// #include "code\modules\mob\living\carbon\xenomorph\castes\predalien\predalien.dm"
// #include "code\modules\mob\living\carbon\xenomorph\castes\predalien\abilities_predalien.dm"
#include "code\modules\mob\living\carbon\xenomorph\castes\puppeteer\castedatum_puppeteer.dm"
#include "code\modules\mob\living\carbon\xenomorph\castes\queen\abilities_queen.dm"
#include "code\modules\mob\living\carbon\xenomorph\castes\queen\castedatum_queen.dm"
#include "code\modules\mob\living\carbon\xenomorph\castes\queen\queen.dm"
#include "code\modules\mob\living\carbon\xenomorph\castes\ravager\ravager.dm"
#include "code\modules\mob\living\carbon\xenomorph\castes\runner\runner.dm"
#include "code\modules\mob\living\carbon\xenomorph\castes\runner\abilities_runner.dm"
#include "code\modules\mob\living\carbon\xenomorph\castes\runner\castedatum_runner.dm"
#include "code\modules\mob\living\carbon\xenomorph\castes\sentinel\castedatum_sentinel.dm"
#include "code\modules\mob\living\carbon\xenomorph\castes\shrike\abilities_shrike.dm"
#include "code\modules\mob\living\carbon\xenomorph\castes\shrike\castedatum_shrike.dm"
#include "code\modules\mob\living\carbon\xenomorph\castes\spitter\castedatum_spitter.dm"
#include "code\modules\mob\living\carbon\xenomorph\castes\warlock\abilities_warlock.dm"
#include "code\modules\mob\living\carbon\xenomorph\castes\warlock\castedatum_warlock.dm"
#include "code\modules\mob\living\carbon\xenomorph\castes\warrior\abilities_warrior.dm"
#include "code\modules\mob\living\carbon\xenomorph\castes\warrior\castedatum_warrior.dm"
#include "code\modules\mob\living\silicon\ai\ai.dm"
#include "code\modules\mob\living\simple_animal\hostile\carp.dm"
#include "code\modules\organs\limb_objects.dm"
#include "code\modules\power\fusion_engine.dm"
#include "code\modules\power\groundmap_geothermal.dm"
#include "code\modules\power\lighting.dm"
#include "code\modules\projectiles\ammo_datums.dm"
#include "code\modules\projectiles\gun_attachables.dm"
#include "code\modules\projectiles\projectile.dm"
#include "code\modules\projectiles\sentries.dm"
#include "code\modules\projectiles\tracer.dm"
#include "code\modules\projectiles\guns\energy.dm"
#include "code\modules\projectiles\guns\grenade_launchers.dm"
#include "code\modules\projectiles\guns\mounted.dm"
#include "code\modules\projectiles\guns\pistols.dm"
#include "code\modules\projectiles\guns\revolvers.dm"
#include "code\modules\projectiles\guns\rifles.dm"
#include "code\modules\projectiles\guns\shotguns.dm"
#include "code\modules\projectiles\guns\smgs.dm"
#include "code\modules\projectiles\guns\specialist.dm"
#include "code\modules\projectiles\magazines\magazines.dm"
#include "code\modules\projectiles\magazines\misc.dm"
#include "code\modules\projectiles\magazines\specialist.dm"
#include "code\modules\projectiles\gun_system.dm"
#include "code\modules\reagents\machinery\chem_dispenser.dm"
#include "code\modules\reagents\reactions\medical.dm"
#include "code\modules\reagents\reagents\medical.dm"
#include "code\modules\reagents\reagents\toxin.dm"
#include "code\modules\reqs\supply.dm"
#include "code\modules\reqs\supplypacks.dm"
#include "code\modules\requisitions\fulton.dm"
#include "code\modules\requisitions\supply_export.dm"
#include "code\modules\shuttle\marine_dropship.dm"
#include "code\modules\vehicles\powerloader.dm"
#include "code\modules\xenomorph\xeno_structures.dm"
#include "code\modules\projectiles\mounted.dm"
