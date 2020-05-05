**Protocol typed by Evan Hass**  
**Last modified on 2020-05-05**

# DNase treatment of RNA  
1. Aliquot 200 ng of RNA from each sample into PCR tubes, and bring to 16 uL with nuclease-free water. If a given sample is too dilute for 16 uL to contain 200 ng of RNA, just use 16 uL.  
2. Make DNase master mix (1x recipe):  

- 2 uL 10x Worthington DNase I Buffer  
- 2 uL Worthington DNase I (Fisher NC9878502)  

3. Add 4 uL of DNase master mix to each PCR tube  
4. Incubate reactions at 37°C for 30 minutes  
5. Stop reactions by incubating at 75°C for 10 minutes  

# cDNA Synthesis  
**_NOTE: All reagents for this cDNA synthesis protocol are included in the SuperScript IV First-Strand Synthesis System (Thermo Fisher 18091200)._**  

1. Transfer 10 uL of DNase-treated RNA to new PCR tubes, and save the other 10 uL  
2. Make priming master mix (1x recipe):  

- 1 uL nuclease-free water  
- 1 uL 50 ng/uL Random Hexamers  
- 1 uL 10 mM dNTP mix  

3. Add 3 uL priming master mix to each tube  
4. Incubate at 65°C for 5 minutes, then snap-cool on ice  
5. Make RT master mix:  

- 4 uL 5x SuperScript IV Buffer  
- 1 uL 100 mM DTT  
- 1 uL RNaseOUT  
- 1 uL SuperScript IV  

6. Add 7 uL of RT master mix to each PCR tube  
7. Run the following program in the thermal cycler:  

- 23°C for 10 minutes  
- 55°C for 10 minutes  
- 80°C for 10 minutes  

# Amplicon library PCR  
Because of how many reads machines like MiSeq and NextSeq achieve per run, you'll likely want to pool multiple amplicon libraries together in one run when it comes time to sequence, meaning you'll want to use primers that will put different indices on each amplicon library in a given group that you're pooling. As of the writing of this protocol as a markdown file (2020-05-01), all of our lab's oligo pools are designed such that the following primer sequences will fit the purpose of this PCR:  

**Fwd primer:** caagcagaagacggcatacgagatXXXXXXgtgactggagttcagacgtgtgctcttccgatctACTGGCCGCTTCACTG (where XXXXXX is the index; JR4-17 and JR45 in our primer database are all versions of this primer with different indices)  
**Rev primer:** AATGATACGGCGACCACCGAGATCTACACTCTTTCCCTACACGACGCTCTTCCGATCT (named JR3 in our primer database)  

Once you've chosen primers for each library, make a mix of each primer pair where each primer is at a concentration of 2 uM. Then, for each library combine the following in a PCR tube:  

- 10 uL of cDNA (save other 10 uL)  
- 5 uL 2 uM primer mix  
- 35 uL of master mix (1x recipe):  
  26.5 uL nuclease-free water  
  5 uL 10x Pfu Ultra Buffer  
  2.5 uL 10 mM dNTP mix  
  1 uL Pfu Ultra II (Agilent 600672)  
  *NOTE: In some situations, I have found that adding 10 uL of NEB 5x High GC Enhancer (included with Q5 polymerase (NEB M0491)) to these reactions helps a little with representation. If you want to use it, the 1x master mix recipe will only have 16.5 uL of water.*  

Run the following program in the thermal cycler:  

- 95°C for 2:00  
---  
- 95°C for 0:30 |  
- 55°C for 0:30 | **24-30 cycles**  
- 72°C for 0:30 |  
---  
- 72°C for 10:00  
- Hold at 4°C  

Run 1 uL of the PCR on the Bioanalyzer (HS DNA Kit, Agilent 5067-4626) to check for a peak of the correct size. If you don't see a strong enough peak at the correct size, run the PCR for several more cycles and check again.  

- *NOTE: Almost always, I find that 24 cycles is sufficient to get a strong peak, so I would start there and only add more cycles if needed.*  

# Amplicon library clean-up (0.6X/1.6X/1.0X triple SPRI cleanup)  
Before starting, warm AMPure XP beads (Beckman Coulter A63881) to room temp for 30 minutes, and make fresh 70% ethanol. If you have more than 8 samples, transfer them to a 96-well plate that fits on the magnet you'll be using (with 8 or fewer samples, you can just use PCR strips).  

**SPRI 0.6X**  

1. Add 0.6X volume AMPure beads (30 uL) and mix by pipetting (gently to minimize foaming).  
2. Incubate 5 minutes at room temp  
3. Pull down beads on magnet for 5 minutes  
4. Transfer the supernatant (~65-70 uL) to a new PCR strip or a new row of the 96-well plate. Be careful not to get any beads when you transfer the supernatant, and note what volume you transfer.  

**SPRI 1.6X**  

1. Add 1.6X volume AMPure beads (e.g., for 70 uL of supernatant above, add 112 uL beads; for 65 uL supernatant, add 104 uL beads), and mix by pipetting (gently to minimize foaming).  
2. Incubate 5 minutes at room temp  
3. Pull down beads on magnet for 5 minutes  
4. Discard supernatant, and keep strip/plate on magnet  
5. Add 200 uL 70% ethanol, incubate for 30 seconds, and discard ethanol (use p200 to aspirate)  
6. Repeat step 5, and discard all ethanol (use p200, then p20 or p10 to aspirate)  
7. Seal strip/plate and quickly spin down  
8. Place back on magnet for 1 minute, and discard all remaining ethanol (use p20 or p10 to aspirate)  
9. Dry beads for 2 minutes at room temp  
10. Resuspend beads in 42 uL nuclease-free water, and mix by pipetting (gently to minimize foaming)  
11. Incubate for 2 minutes at room temp  
12. Pull down beads on magnet for 5 minutes  
13. Transfer 40 uL of supernatant to a new PCR strip or a new row of the 96-well plate  

**SPRI 1.0X**  

1. Add 1.0X volume AMPure beads (40 uL), and mix by pipetting (gently to minimize foaming).  
2. Incubate 5 minutes at room temp  
3. Pull down beads on magnet for 5 minutes  
4. Discard supernatant, and keep strip/plate on magnet  
5. Add 200 uL 70% ethanol, incubate for 30 seconds, and discard ethanol (use p200 to aspirate)  
6. Repeat step 5, and discard all ethanol (use p200, then p20 or p10 to aspirate)  
7. Seal strip/plate and quickly spin down  
8. Place back on magnet for 1 minute, and discard all remaining ethanol (use p20 or p10 to aspirate)  
9. Dry beads for 3-4 minutes at room temp  
10. Resuspend beads in 16 uL nuclease-free water, and mix by pipetting (gently to minimize foaming)  
11. Incubate for 2 minutes at room temp  
12. Pull down beads on magnet for 5 minutes  
13. Transfer 15 uL of supernatant to a labeled PCR strip  

Use 1 uL of your cleaned-up libraries to measure DNA concentration on the Qubit using the dsDNA HS Kit (Thermo Fisher Q32854). Then, dilute to ~0.5 ng/uL and run 1 uL on the Bioanalyzer (HS DNA Kit, Agilent 5067-4626) to check for successful removal of extraneous DNA species.  
