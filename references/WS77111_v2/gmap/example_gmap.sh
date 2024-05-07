gmap_build -d ptaeda.v1.01_LODGEPOLE -D /data/Pine_genome/gmap_db ptaeda.v1.01.fa.masked.reduced_all_snps_indels_LODGEPOLE.fasta 

and map the exons to the new database:

gmapl -d ptaeda.v1.01_LODGEPOLE -D /data/Pine_genome/gmap_db/ -A /data/Pine_genome/exons/submitted/pine_all_sequences_with_probes.fasta -B 5 -f 2 > all_probe_parent_seqs_to_ptaeda.v1.01_LODGEPOLE.gff
