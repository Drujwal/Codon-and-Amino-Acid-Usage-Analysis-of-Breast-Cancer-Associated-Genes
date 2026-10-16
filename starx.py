from Bio import SeqIO

input_path = "finalset.fa"
star_output_path = 'star_counts.tsv'
x_output_path = 'X_counts.tsv'

star_output = open(star_output_path, 'w')
x_output = open(x_output_path, 'w')

star_output.write('Gene\tStars\n')
x_output.write('Gene\tX\tlength\n')

with open(input_path, 'r') as fasta_file:
    for cur_record in SeqIO.parse(fasta_file, "fasta"):
        print(f"Processing: {cur_record.name}")

        gene_name = cur_record.name
        sequence = cur_record.seq
        length = len(sequence)

        star_count = sequence.count('*')
        x_count = sequence.count('X')

        star_output.write('%s\t%i\t%f\n' % (gene_name, star_count, length))
        x_output.write('%s\t%i\t%f\n' % (gene_name, x_count, length))

star_output.close()
x_output.close()
