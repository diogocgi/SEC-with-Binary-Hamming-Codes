# SEC-with-Binary-Hamming-Codes
Single-error-correction of messages with binary Hamming Code in Quartus VHDL

## Table of Contents
- [Objective](#objective)
- [What's included](#whats-included)
- [Implementation](#implementation)
    - [Encoder](#encoder)
    - [Decoder](#decoder)
- [Creators](#creators)

## Objective

This project is the first assignment of the Advanced Computer Architecture (ACA) subject directed by professor António Borges.

The premise of this project was to implement the Hamming code for 1-bit error correction with the triplet [15, 11, 3], where:
- n (number of bits of the encoded message) = 15
- k (number of information bits) = 11
- d (Hamming distance) = 3.

The encoder and decoder had to be implemented with the structural modeling style in order to closely simulate and describe the hardware.

The module:

- encoder was implemented with a sequential digital circuit, from the schematics given by the professor
- decoder was implemented with a combinatorial digital circuit

## What's included
```
Decoder/
    +-- and_2.vhd 	
    +-- decoder.vhd 	
    +-- decoder.vwf
    +-- xnor_2.vhd
    +-- xor_2.vhd
Encoder/
    +-- Flip_flop_bundle.vhd 	
    +-- and_2.vhd 	
    +-- and_4.vhd
    +-- control_unit.vhd 	
    +-- control_unit.vwf
    +-- counter_4bit.vhd 	
    +-- counter_4bits.vhd 	
    +-- encoder.vhd
    +-- encoder.vwf
    +-- flipFlopDSimul.vhd 	
    +-- mux2_1.vhd 	
    +-- mux4_1.vhd 	
    +-- nand_2.vhd 	
    +-- not_1.vhd 	
    +-- or_2.vhd 	
    +-- rom.vhd
    +-- rom.vwf 	
    +-- xnor_2.vhd
    +-- xor_2.vhd
```

## Implementation

In order to implement the encoder and decoder, we first calculated *n* and *k* based on the number of redundant bits *r* = 4 required by the project. The following formulas were used:

- length of the encoded message:

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;![f1]

- length of the message:

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;![f2]

[f1]: https://chart.apis.google.com/chart?cht=tx&chl=n=2^r-1
[f2]: https://chart.apis.google.com/chart?cht=tx&chl=k=n-r

### Encoder

The encoding process is described by the formula:

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;![f3]

where:

- *x* is the encoded message
- *m* is the message to be encoded
- *G* is the *k* x *n* generator matrix

To get the generator matrix, the following formula was used:

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;![f4]

where:
- ![f5] is the *k* x *k* identity matrix

![id_matrix_Ik]


[f3]: https://chart.apis.google.com/chart?cht=tx&chl=x=m*G
[f4]: https://chart.apis.google.com/chart?cht=tx&chl=G=[I_k|A^T]
[f5]: https://chart.apis.google.com/chart?cht=tx&chl=I_k
[id_matrix_Ik]: https://github.com/Diogo525/SEC-with-Binary-Hamming-Codes/images/identity_matrix_Ik.png
[matrix_a]: https://github.com/Diogo525/SEC-with-Binary-Hamming-Codes/images/matrix_A.png
[matrix_a_transpose]: https://github.com/Diogo525/SEC-with-Binary-Hamming-Codes/images/transpose_of_matrix_A.png




### Decoder




## Creators

**Diogo Guedes**

- <https://github.com/Diogo525>

**Miguel Carvalho**

- to be filled
