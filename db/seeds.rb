################################################################################################
### SEED FILE FOR SAMPLE DATA
################################################################################################

##########################################################################################################################################################################
# => User account
##########################################################################################################################################################################
user = User.create(fullname: 'root', provider: 'unkown', email: 'root@bioparts')
group1 = Group.create(name: 'admin', description: 'groups for biopartsdb admin')
group2 = Group.create(name: 'staff', description: 'groups for biopartsdb users')

##########################################################################################################################################################################
# => Parts
##########################################################################################################################################################################
organism = Organism.create(name: 'yeast', latin: 'Saccharomyces cerevisiae', gbtaxonid: 4932)
feature = Feature.create(so: 'SO:0000167', name: 'promoter', namespace: 'sequence', definition: 'A regulatory_region composed of the TSS(s) and binding sites for TF_complexes of the basal transcription machinery.')
sequence = Sequence.create(data: 'AATATTTGTATTGTTTTATGTAATTATAATCTTAAGCTTGCAATACCAATCACTATTACCATGTTAATGATCCCCCAGATAAAAAGACAAGACAGAGCATATATCAGACTACATTAACATCTGTACACCCCCAACTGCTTTGAAAAAACCCATGCAGTTATTATTTTCAACAGACCAAGTTTTTTTATCGCTTATCCGGCTCACAGAACGAGCCGTACAACCGTCATCAGACTTGCATGGAAATGTTGAAAAAGAGGTAAAAAAGAAAATATCAAACCCAAACACGCTCGGGCTGAAAAATTAATATGGCAGGAAACGAACTGTAGCCATAATGTACCTGTTCCCGCTAATAGTAATACCATCGTATTGCTAAGGTTAGTAGCTAAAAATCTCTTACTTTCTTTATTTTGACTCTTAGGTCTTACAAGCAATACAAAACCAACACACCTATATATAACTAATA')
location = Location.create(organism: organism, chromosome: 'chr02', start: 60736, stop: 61198, strand: -1 )
part = Part.create(name: 'yeast_promoter_YBL087C', sequence: sequence, feature:feature, location: location)

##########################################################################################################################################################################
# => Vendor
##########################################################################################################################################################################
vendor = Vendor.create(name: 'IDT')

##########################################################################################################################################################################
# => Strain
##########################################################################################################################################################################
strain = Strain.create(name: "Test Strain", vendor_id: 1, organism_id: 1)

##########################################################################################################################################################################
# => Oligo Plates
##########################################################################################################################################################################
oligoPlate = OligoPlate.create(name: 'JHU_PARTS_2012_OLIGO_1', vendor: vendor, user: user)
oligo = Oligo.create(part: part, name: 'yeast_promoter_YBL087C.o01', start: 1, stop: 150, sequence: 'AATATTTGTATTGTTTTATGTAATTATAATCTTAAGCTTGCAATACCAATCACTATTAC')
well = OligoPlateWell.create(oligo: oligo, oligo_plate: oligoPlate, well: 'A01')
plasmid = Plasmid.create(vendor: vendor, name: "pGEM-T")

##########################################################################################################################################################################
# => Devices
##########################################################################################################################################################################
device_type = DeviceType.create(value: "pcr", description: "PCR Device")
device = Device.create(device_type_id: 1, name: "Test PCR Machine")

######################################################################################################
# =>            STATUS
######################################################################################################
status1 = Status.create(process: "Spcr", name: "Pending", default: 1 )
status2 = Status.create(process: "Spcr", name: "Finished")
status3 = Status.create(process: "Tpcr", name: "Pending", default: 1 )
status4 = Status.create(process: "Tpcr", name: "Finished")
status5 = Status.create(process: "Fpcr", name: "Pending", default: 1 )
status6 = Status.create(process: "Fpcr", name: "Finished")
status7 = Status.create(process: "PcrGel", name: "Pending", default: 1 )
status8 = Status.create(process: "PcrGel", name: "Finished")
status9 = Status.create(process: "Ligation", name: "Pending", default: 1 )
status10 = Status.create(process: "Ligation", name: "Finished")
status11 = Status.create(process: "Transformation", name: "Pending", default: 1 )
status12 = Status.create(process: "Transformation", name: "Finished")
status13 = Status.create(process: "Clone", name: "Growing", default: 1 )
status14 = Status.create(process: "Clone", name: "Picked")
status15 = Status.create(process: "Cspcr", name: "Pending", default: 1 )
status16 = Status.create(process: "Cspcr", name: "Finished")
status17 = Status.create(process: "CspcrGel", name: "Pending", default: 1 )
status18 = Status.create(process: "CspcrGel", name: "Finished")
status19 = Status.create(process: "Sequencing", name: "Pending", default: 1 )
status20 = Status.create(process: "Sequencing", name: "Finished")
status21 = Status.create(process: "Sequencing", name: "Mailed")

######################################################################################################
# => Quality Control
######################################################################################################
qc1 = QualityControl.create(process: "Spcr", name: "PASS")
qc2 = QualityControl.create(process: "Spcr", name: "FAIL")
qc3 = QualityControl.create(process: "Tpcr", name: "PASS")
qc4 = QualityControl.create(process: "Tpcr", name: "FAIL")
qc5 = QualityControl.create(process: "Fpcr", name: "PASS")
qc6 = QualityControl.create(process: "Fpcr", name: "FAIL")
qc7 = QualityControl.create(process: "PcrGelLane", name: "PASS")
qc8 = QualityControl.create(process: "PcrGelLane", name: "FAIL")
qc9 = QualityControl.create(process: "Ligation", name: "PASS")
qc10 = QualityControl.create(process: "Ligation", name: "FAIL")
qc11 = QualityControl.create(process: "Transformation", name: "PASS")
qc12 = QualityControl.create(process: "Transformation", name: "FAIL")
qc13 = QualityControl.create(process: "Cloning", name: "PASS")
qc14 = QualityControl.create(process: "Cloning", name: "FAIL")
qc15 = QualityControl.create(process: "Cspcr", name: "PASS")
qc16 = QualityControl.create(process: "Cspcr", name: "FAIL")
qc17 = QualityControl.create(process: "CspcrGel", name: "PASS")
qc18 = QualityControl.create(process: "CspcrGel", name: "FAIL")
qc19 = QualityControl.create(process: "CspcrGelLane", name: "PASS")
qc20 = QualityControl.create(process: "CspcrGelLane", name: "FAIL")
qc21 = QualityControl.create(process: "Sequencing", name: "PASS")
qc22 = QualityControl.create(process: "Sequencing", name: "FAIL")
qc23 = QualityControl.create(process: "Sequencing", name: "CHECK")
qc24 = QualityControl.create(process: "Sequencing", name: "FIXABLE")
qc25 = QualityControl.create(process: "Sequencing", name: "MISLABELLED")

###########################################################################################################################################################################################
# => Protocol reagents
###########################################################################################################################################################################################
prot_reag1 = ProtocolReagent.create(protocol_id: "6", name: "H2O", stock_concentration: "-", final_concentration: "-", volume_reaction: "14.25 ul")
prot_reag2 = ProtocolReagent.create(protocol_id: "6", name: "Herculase Bffer", stock_concentration: "5 x", final_concentration: "1 x", volume_reaction: "5.0 ul")
prot_reag3 = ProtocolReagent.create(protocol_id: "6", name: "dNTPs", stock_concentration: "2.5 mM", final_concentration: "250 uM", volume_reaction: "2.5 ul")
prot_reag4 = ProtocolReagent.create(protocol_id: "6", name: "Genomic DNA Template", stock_concentration: "-", final_concentration: "-", volume_reaction: "0.5 ul")
prot_reag5 = ProtocolReagent.create(protocol_id: "6", name: "1:5 Diluted Herculase DNA Pol", stock_concentration: "-", final_concentration: "-", volume_reaction: "0.75 ul")
prot_reag6 = ProtocolReagent.create(protocol_id: "6", name: "Total", stock_concentration: "-", final_concentration: "-", volume_reaction: "23.0 ul")
prot_reag7 = ProtocolReagent.create(protocol_id: "1", name: "H2O", stock_concentration: "-", final_concentration: "-", volume_reaction: "14.25 ul")
prot_reag8 = ProtocolReagent.create(protocol_id: "1", name: "Herculase Bffer", stock_concentration: "5 x", final_concentration: "1 x", volume_reaction: "5.0 ul")
prot_reag9 = ProtocolReagent.create(protocol_id: "1", name: "dNTPs", stock_concentration: "2.5 mM", final_concentration: "250 uM", volume_reaction: "2.5 ul")
prot_reag10 = ProtocolReagent.create(protocol_id: "1", name: "1:5 Diluted Herculase DNA Pol", stock_concentration: "-", final_concentration: "-", volume_reaction: "0.75 ul")
prot_reag11 = ProtocolReagent.create(protocol_id: "1", name: "DNA Template", stock_concentration: "-", final_concentration: "-", volume_reaction: "0.5 ul")
prot_reag12 = ProtocolReagent.create(protocol_id: "1", name: "Total", stock_concentration: "-", final_concentration: "-", volume_reaction: "23 ul")
prot_reag13 = ProtocolReagent.create(protocol_id: "2", name: "H2O", stock_concentration: "-", final_concentration: "-", volume_reaction: "14.75 ul")
prot_reag14 = ProtocolReagent.create(protocol_id: "2", name: "Herculase Bffer", stock_concentration: "5 x", final_concentration: "1 x", volume_reaction: "5.0 ul")
prot_reag15 = ProtocolReagent.create(protocol_id: "2", name: "dNTPs", stock_concentration: "2.5 mM", final_concentration: "250 uM", volume_reaction: "2.5 ul")
prot_reag16 = ProtocolReagent.create(protocol_id: "2", name: "Diluted Herculase DNA Pol", stock_concentration: "-", final_concentration: "-", volume_reaction: "0.25 ul")
prot_reag17 = ProtocolReagent.create(protocol_id: "2", name: "Total", stock_concentration: "-", final_concentration: "-", volume_reaction: "22.5 ul")
prot_reag18 = ProtocolReagent.create(protocol_id: "3", name: "H2O", stock_concentration: "-", final_concentration: "-", volume_reaction: "12.75 ul")
prot_reag19 = ProtocolReagent.create(protocol_id: "3", name: "Herculase Bffer", stock_concentration: "5 x", final_concentration: "1 x", volume_reaction: "5.0 ul")
prot_reag20 = ProtocolReagent.create(protocol_id: "3", name: "dNTPs", stock_concentration: "2.5 mM", final_concentration: "250 uM", volume_reaction: "2.5 ul")
prot_reag21 = ProtocolReagent.create(protocol_id: "3", name: "Diluted Herculase DNA Pol", stock_concentration: "-", final_concentration: "-", volume_reaction: "0.25 ul")
prot_reag22 = ProtocolReagent.create(protocol_id: "3", name: "Total", stock_concentration: "-", final_concentration: "-", volume_reaction: "20.5 ul")
prot_reag23 = ProtocolReagent.create(protocol_id: "9", name: "H2O", stock_concentration: "-", final_concentration: "-", volume_reaction: "4.25 ul")
prot_reag24 = ProtocolReagent.create(protocol_id: "9", name: "GoTaq Green", stock_concentration: "2 x", final_concentration: "1 x", volume_reaction: "6.25 ul")
prot_reag25 = ProtocolReagent.create(protocol_id: "9", name: "Forward Primer", stock_concentration: "-", final_concentration: "-", volume_reaction: "0.5 ul")
prot_reag26 = ProtocolReagent.create(protocol_id: "9", name: "Reverse Primer", stock_concentration: "-", final_concentration: "-", volume_reaction: "0.5 ul")
prot_reag27 = ProtocolReagent.create(protocol_id: "9", name: "Total", stock_concentration: "-", final_concentration: "-", volume_reaction: "11.5 ul")
prot_reag28 = ProtocolReagent.create(protocol_id: "5", name: "Water", stock_concentration: "-", final_concentration: "-", volume_reaction: "1.5 ul")
prot_reag29 = ProtocolReagent.create(protocol_id: "5", name: "Salt Solution", stock_concentration: "-", final_concentration: "-", volume_reaction: "0.5 ul")
prot_reag30 = ProtocolReagent.create(protocol_id: "5", name: "PCR II Blunt TOPO", stock_concentration: "-", final_concentration: "-", volume_reaction: "0.5 ul")
prot_reag31 = ProtocolReagent.create(protocol_id: "5", name: "Fresh Pcr Product", stock_concentration: "-", final_concentration: "-", volume_reaction: "0.5 ul")
prot_reag32 = ProtocolReagent.create(protocol_id: "5", name: "Total", stock_concentration: "-", final_concentration: "-", volume_reaction: "3 ul")



##########################################################################################################################################################################
# => Protocol
##########################################################################################################################################################################
prot1 = Protocol.create(process: "Spcr", name: "cDNA PCR", scaling_factor: 3, user: user)
prot2 = Protocol.create(process: "Tpcr", name: "tPCR", scaling_factor: 3, user: user)
prot3 = Protocol.create(process: "Fpcr", name: "fCPR", scaling_factor: 3, user: user)
prot4 = Protocol.create(process: "PcrGel", name: "PCR Gel", scaling_factor: 3, user: user)
prot5 = Protocol.create(process: "Ligation", name: "Ligation", scaling_factor: 3, user: user)
prot6 = Protocol.create(process: "Spcr", name: "Genomic DNA PCR", scaling_factor: 3, user: user)
prot7 = Protocol.create(process: "Transformation", name: "Transformation", scaling_factor: 3, user: user)
prot8 = Protocol.create(process: "Cloning", name: "Cloning", scaling_factor: 3, user: user)
prot9 = Protocol.create(process: "Cspcr", name: "csPCR", scaling_factor: 3, user: user)
prot10 = Protocol.create(process: "CspcrGel", name: "csPCR Gel", scaling_factor: 3, user: user)
prot11 = Protocol.create(process: "Sequencing", name: "Submitting Clones for Sequencing", scaling_factor: 3, user: user)
