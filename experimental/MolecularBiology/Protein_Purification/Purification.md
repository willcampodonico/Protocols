Author: Will Campodonico  
Date: 6/4/2020

This is a general protocol for purification of recombinant protein from e. coli. It was adapted from the Wuttke Lab GR-DBD purification protocol.  

## Materials
- Bacterial pellet - see BacterialExpression.md
- 2x Lysis buffer (make 500mL) - this is used to make lysis buffer, wash buffers, and elution buffer  
  - 40mM Tris pH 7.5  
  - 2M NaCl  
  - 10% Glycerol  
  - 20mM Imidizole  
- 1x Column/dialysis buffer (make 5L, 1L for column and 4L for dialysis)
  - 20mM Tris pH 7.5  
  - 100mM NaCl  
  - 5% Glycerol  
  - 1mM DTT
## Procedure  
### Lysis   
- Resuspend bacterial pellet in 50mL 1x Lysis buffer + 1x protease inhibitor (I like to add 25mL to the 50mL conical and vortex to facilitate resuspension, then transfer to a plastic beaker and add remaining 25mL Lysis buffer)  
  - Take a sample for SDS-PAGE  
- Sonicate with 1/2" tip at power 8.0 for a total of 1:45 (15s on/45s off, 7 cycles)
  - **This sonicator is not general use - ask the Wuttke or Cech labs for help**  
  - Perform this sonication on ice  
  - Take a sample for SDS-PAGE  
- Clear by Centrifugation   
  - 15k RPM for 30min in an F21 rotor (Cech Lab)  
  - Collect Supernatant ("Cleared Lysate")  
  - Take a sample for SDS-PAGE  
### Ni-NTA purification   
- Equilibrate ~6mL Ni-NTA beads (Midtown Fridge) with 1x Lysis buffer (this can be done in the capped gravity flow column, but I prefer a 50mL conical)  
  - Add 6mL bead slurry to a 50mL conical   
  - Spin at 400xg for 5 minutes to pellet beads. Discard supernatant  
  - Discard storage buffer   
  - Resuspend in 50mL 1x Lysis buffer  
  - Spin at 400xg for 5 minutes to pellet beads. Discard supernatant  
- Add cleared lysate to the 50mL conical, and incubate at 4C for 1hr with rotation  
  - During this incubation, make wash and elution buffers  
  - Wash1: 1x Lysis buffer + 10mM Imidazole (20mM imidazole total)  
  - Wash2: 1x Lysis buffer + 20mM Imidazole (30mM imidazole total)  
  - Elution: 1x Lysis buffer + 290mM Imidazole (300mM imidazole total)  
- After 1hr, pour cleared lysate with Ni-NTA beads into a gravity flow column  
  - Collect flowthrough (take a sample for SDS-PAGE)  
  - Add Wash1, collect flowthrough (take a sample for SDS-PAGE)  
  - Add Wash2, collect flowthrough (take a sample for SDS-PAGE)  
  - Add Elution, collect flowthrough (take a sample for SDS-PAGE)  
- Run SDS-PAGE for analysis of bacterial expression and efficiency of purification  
- Dialyze Elution overnight into 4L column/dialysis buffer  
- Equilibrate FPLC column with appropriate buffer **(Get help from an owner of the FPLC)**  
### Size exclusion column
- **I worked with Anne (Cech Lab) to optimize FPLC protocol, including column choice**  
- Concentrate dialyzed sample in a spin column. Final volume should be <1mL  
- Spin sample 15,000 RPM for 10min to clear any precipitates before loading onto the column  
- Based on UV254 trace, analyze fractions by SDS-PAGE   
- Collect relevant fractions, and pool  
- Determine protein concentration by BCA assay. If desired, sample can be concentrated with a spin column  
- Aliquot and flash freeze protein samples  
