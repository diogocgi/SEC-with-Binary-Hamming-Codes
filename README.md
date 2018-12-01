# SEC-with-Binary-Hamming-Codes
Single-error-correction of messages with binary Hamming Code in Quartus VHDL

##### Table of Contents
- [Objective](#objective)
- [What's included](#included)
- [Creators](#creators)


## Objective

The premise of the project was to implement the Hamming code for 1-bit error correction with the triplet [11, 15, 3], where:
- k (number of information bits) = 11
- n (number of bits of the encoded message) = 15
- d (Hamming distance) = 3.

The encoder and decoder had to be implemented with the structural modeling style in order to closely simulate and describe the hardware.

The module:

- encoder was implemented with a sequential digital circuit, from the schematics given by the teacher
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
