### Aptamer-tagged RNA expression and purification
##### Author: Will Campodonico
##### Last updated: 5 May 2020

#### This protocol is an adaptation of the XtremeGENE DNA transfection protocol, followed by pulldown.

HEK293T XtremeGENE DNA Transfection Protocol

**The day before**
-	Seed your cells such that they will be ~50% confluent the next day. Cell density will dramatically influence transfection efficiency.

**Before transfection**
-	Warm up media WITHOUT antibiotics, XtremeGENE DNA transfection reagent, and OptiMEM
-	Make sure you also have media WITH antibiotics; you’ll need it for the last step.

1. Dilute DNA in OptiMEM to 10 ng/uL, and mix gently
- For a 10-cm dish, dilute ~10 ug DNA in 1 mL OptiMEM.  
- For a 15-cm dish, dilute ~20 ug DNA in 2 mL OptiMEM.  
2.	Vortex transfection reagent briefly, then add transfection reagent to the DNA/OptiMEM mix such that the ratio of uL of reagent to ug of DNA=3, BEING CAREFUL NOT TO TOUCH WALLS OF PLASTIC WITH REAGENT. Mix gently.
- For a 10-cm dish, add 30 uL of transfection reagent.
- For a 15-cm dish, add 60 uL of transfection reagent.
3.	Incubate mix for 15 minutes at room temp
4.	During the 15-minute incubation, wash your cells twice with normal dish volume of media WITHOUT antibiotics
5.	After aspirating the second wash, add normal dish volume of media without antibiotics
6.	Add the DNA/OpitMEM/transfection reagent mix to the cells in a dropwise manor
7.	Incubate cells in the cell culture incubator for 6 hours
8.	Aspirate media and replace with media WITH antibiotics

For the purposes of a fRIP-MPRA experiment, I wait until the cells are 80-100% confluent before I harvest, which is usually 2 days after transfection. It is also a good idea to have a positive control plasmid for transfection (something fluorescent)

#### Pulldown
Replace media with equal volume ice cold PBS  
UV crosslink cells (Parker lab StrataLinker, 200,000µJ, on that machine set by power, type 2000, hit go)  
Harvest cells by scraping  
Wash twice with 10mL ice cold PBS  
Lyse cells by resuspension in RIPA buffer, and dounce homogenization  
Pellet cellular debris (13K RPM x 15 minutes)  
Remove supernatant  
Wash and treat beads (~20µL per plate) to inhibit RNase, according to manufacturer's protocols  
Incubate beads with nuclear lysis, 4oC on nutator for at least 1hr (I did ~3hr).  
**Wash beads:**  
1x RIPA buffer  
3x5min, 4oC on a nutator, RIPA buffer  
1x RIPA buffer  
2x Wash Buffer 150  
#### At this point, bead treatment will depend on downstream analysis. 
- For SDS-PAGE or western blotting, resuspend beads in 40µL 6x protein loading buffer and boil (95C for 5 minutes) and load full sample, including beads, directly into gel.  
- For Mass Spec, wash beads an additional 10x in 1mL PBS (or any buffer **without detergent**)
