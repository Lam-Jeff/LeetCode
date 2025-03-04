SELECT
sample_id
, dna_sequence
, species
, IF(dna_sequence like "ATG%", 1, 0) as has_start
, IF(REGEXP_LIKE(dna_sequence, "(TAA|TAG|TGA)$"), 1, 0) as has_stop
, IF(dna_sequence like "%ATAT%", 1, 0) as has_atat
, IF(dna_sequence like "%GGG%", 1, 0) as has_ggg
FROM Samples
ORDER BY sample_id ASC
