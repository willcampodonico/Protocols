# fRIP Protocol

**_This protocol calls for 10 million cells and yields enough crosslinked lysate for 2 IPs (i.e., 5 million cells of lysate per IP)._**

## Day 1 - Crosslinking and harvesting
1. For adherent cells, start by scraping your cells into media. Then, transfer your cells to a 50-mL conical tube on ice.

- *NOTE: If you're working with adherent cells and you want to count them directly, you'll likely want to harvest them by trypsinization instead of scraping to break up cell clumps.*

2. Spin down cells at 500 x g for 5 minutes at 4°C. Discard supernatant
3. Resuspend pellet in 10 mL ice-cold PBS and transfer to 15-mL conical tube on ice
4. Spin down cells at 500 x g for 5 minutes at 4°C. Discard supernatant
5. Resuspend pellet in 2 mL ice-cold PBS
6. Add 5.6 uL of 37% formaldehyde (final concentration of 0.1%)
7. Put tube on tilt board or rotator at room temperature for 10 minutes
8. Add 100 uL 2.5 M glycine (final concentration 125 mM)
9. Put tube on tilt board at room temperature for 5 minutes
10. Spin down cells at 500 x g for 5 minutes at 4°C. Discard supernatant
11. Resuspend pellet in 2 mL PBS + 1x Roche cOmplete Protease Inhibitor Cocktail (Roche 11873580001)

- *NOTE: Add PI cocktail to PBS fresh shortly before use.*
- *NOTE: For adding the PI cocktail here and all other steps where it is used in this protocol, I work from a 25x stock (e.g., dissolve one PI tablet in 2 mL water), which I store at -20°C.*

12. Spin down cells at 500 x g for 5 minutes at 4°C. Discard supernatant
13. Resuspend pellet in 1 mL ice-cold PBS+Roche Protease Inhibitor Cocktail and transfer to eppendorf tube on ice
14. Spin down cells at 500 x g for 5 minutes at 4°C. Discard supernatant
15. Flash-freeze pellet in liquid nitrogen, and store at -80°C.

## Day 2 - Lysing, shearing, filtering, and pre-clearing lysate
1. Thaw crosslinked cell pellet, and resuspend in 1 mL cold **RIPA+ Buffer** on ice

- 50 mM Tris pH 8
- 150 mM KCl
- 0.1% SDS
- 1% Triton-X
- 5 mM EDTA
- 0.5% sodium deoxycholate
- **_0.5 mM DTT_**
- **_1x Roche cOmplete Protease Inhibitor Cocktail_**
- **_100 U/mL RNaseOUT (Invitrogen 10777019)_**
- (add **_these_** components fresh shortly before use)

2. Rotate samples at 4°C for 10 minutes
3. Sonicate samples. Optimal sonication conditions will need to be determined for different cell types and sonicators. We have used the following conditions:
- Diagenode Bioruptor: on the high setting using a 30 seconds on/30 seconds off cycle for 15 minutes.
- *NOTE: To avoid the water bath warming up too much, I usually split this up into three 5-minute sonication steps and change out the ice in the water bath in between.*
- Covaris M220: Manufacturer instructions can be found on [their website](https://www.covaris.com/protocols/)

4. Spin down cells at 13,000 RPM for 10 minutes at 4°C
5. Transfer supernatant to new 2-mL tube on ice, and discard pellet
6. Add 1 mL cold **fRIP+ Buffer** to bring volume to 2 mL

- 25 mM Tris pH 7.5
- 150 mM KCl
- 5 mM EDTA
- 0.5% NP-40
- **_0.5 mM DTT_**
- **_1x Roche cOmplete Protease Inhibitor Cocktail_**
- **_100 U/mL RNaseOUT_**
- (add **_these_** components fresh shortly before use)

7. Filter sample through 0.45 micron filter into a new 2-mL tube

- *NOTE: You’ll lose some material here because the filter will absorb some liquid.*

8. Split the sample evenly between two new eppendorf tubes (each with ~5 million cells worth of lysate)
9. Prep protein G dynabeads (Thermo Fisher 10003D):
  + Transfer 25 uL of protein G dynabeads per IP condition (i.e., per ~5 million cells of lysate) to an Eppendorf tube.
  + Pull down beads with magnet, and discard storage buffer
  + Wash beads twice in 1 mL cold fRIP+ Buffer
  + Resuspend beads in original volume of cold fRIP+ Buffer
10. Add 25 uL of prepped protein G dyabeads beads to each tube of lysate
11. Rotate tubes at 4°C for 30 minutes
12. Pull down beads with magnet and transfer supernatant to new tube
13. Take two 25-uL aliquots from each tube of pre-cleared lysate. One aliquot will serve as the RNA input sample, and the other will serve as the input sample for a western blot.
14. Flash-freeze pre-cleared lysate tubes and input aliquots in liquid nitrogen, and store at -80°C.

## Day 3 - Immunoprecipitation
For each IP, thaw one tube of pre-cleared lysate. Then:
1. Add 6 uL (or 6 ug) of desired antibody

- *NOTE: The original fRIP protocol from Hendrickson et al. called for 6 ug of antibody "unless otherwise directed." While some antibodies are provided by companies at 1 ug/uL, I have found that many others are provided at much lower concentrations, making adding 6 ug of antibody impractical from a volume perspective. For all the successful fRIP experiments I have done, I've just added 6 uL of antibody regardless of the antibody concentration, and this has worked fine for several antibodies that are more dilute than 1 ug/uL.*

2. Vortex tube gently, and rotate at 4°C for 2 hours
3. Prepping protein G dynabeads (Thermo Fisher 10003D):
  + Transfer 50 uL of protein G dynabeads per IP to an Eppendorf tube.
  + Pull down beads with magnet, and discard storage buffer
  + Wash beads twice in 1 mL cold fRIP+ Buffer (as previously, add the DTT, PI cocktail, and RNaseOUT fresh shortly before use)
  + Resuspend beads in original volume of cold fRIP+ Buffer
4. Add 50 uL of prepped beads to each tube of lysate
5. Rotate at 4°C for 1 hour
6. Pull down beads with magnet, adn discard supernatant
7. Wash beads 4 times in 1 mL fRIP+ buffer, each time rotating at 4°C for 10 minutes
8. **_BEFORE ASPIRATING THE LAST WASH_**, transfer 100 uL of beads to a new tube. This ~10% aliquot will serve as an IP sample for a western blot, and the remaining ~90% will be used for isolating RNA.
9. Pull down beads with a magnet for both the ~900-uL and 100-uL samples.
10. Store beads at -20°C.

## Day 4 - Reversing crosslings and isolating RNA
Thaw the "for RNA" input and IP samples from days 2 and 3, respectively. Then:

1. Bring volumes of all samples to 56 uL with water, and transfer to a PCR strip. For IP samples, transfer everything to the PCR strip **_including the beads_**.
2. Add the following to each sample:

- 33 uL **3X RCL Buffer** (3x PBS, 6% N-lauroly sarcosine, 30 mM EDTA, 15 mM DTT, **_make this fresh each time_**)
- 10 uL 20 mg/mL proteinase K
- 1 uL RNaseOUT

3. Incubate at 42°C for 1 hour
4. Incubate at 55°C for 1 hour
5. Transfer samples from PCR tubes into new Eppendorf tubes (again, for IP samples, transfer everything to the new tubes, **_including the beads_**).

- *NOTE: The rest of this protocol is just our lab's standard Trizol/RNeasy RNA isolation protocol.*

6. Add 1 mL Trizol to each sample and mix briefly by pipetting
7. Let samples sit for 5 minutes at room temp
8. Add 200 uL chloroform to each tube. Vortex vigorously for ~15 seconds.
9. Let samples sit for 3 minutes at room temp
10. Spin down at 12,000 x g for 15 minutes at 4°C
11. Transfer aqueous layers to new tubes
12. Add 1 volume of 75% ethanol (~500 uL), and vortex to mix
13. Load each sample 700 uL at a time onto an RNeasy spin column from the Qiagen RNeasy Plus Mini Kit, each time spinning at 800 x g for 15 seconds at 4°C and then discarding the flowthru. Repeat until the samples are fully loaded onto the columns.
14. Add 700 uL RW1 Buffer to the column, spin at 8000 x g for 15 seconds at 4°C, then discard the flowthru

- *NOTE: DISCARD FLOWTHRU IN GUANIDINIUM WASTE.*

15. Add 500 uL RPE Buffer to the column, spin at 8000 x g for 15 seconds at 4°C, then discard the flowthru
16. Add 500 uL RPE Buffer to the column, spin at 8000 x g for 2 minutes at 4°C, then discard the flowthru
17. Dry columns by spinning at full speed (~13,000 RPM) for 2 minutes at 4°C
18. Transfer spin columns to new Eppendorf tubes, add 30 uL of RNase-free water to the column and elute RNA by spinning at 8000 x g for 1 minute at 4°C.
19. Measure concentrations of RNA samples

- *NOTE: For input samples, I usually get concentrations in the range of 150-200 ng/uL. For IP samples, however, the RNA is almost always too dilute to be detectable by the Qubit RNA HS Kit, so don't be alarmed if you don't get a reading from your IP samples.*

20. Store RNA samples at -80°C.
