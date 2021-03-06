# PRP-project

## Code

The code models a **BSC channel** along with the **Maximum Likelihood Decoder**

### Functions Used

- **barray:** Forms binaray vector of specified size and fixed length for each sequence
- **channel:** Represents a Binary Symmetric Channel with Bit flip probability p
- **decoder:** Represents a Maximum likelihood Decoder, which returns a codeword given which the received sequence had highest probability. That is, the original codeword inferenced from the received codeword.
- **freqArr:** Returns the unique characters present in the input file, along with their probability
- **strtoBin:** Converts string of binary sequence to a vector of binary digits
- **toString** Converts vector of binary digits to a string of binary sequence
- **Comm_model** Calls all the above functions to represent the communication model, it loads the "File2_Words.txt" file and transmits it through the BSC channel and stores the decoded message in "text_transmitted.txt"


