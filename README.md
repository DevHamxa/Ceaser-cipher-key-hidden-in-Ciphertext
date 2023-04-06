# Ceaser-cipher-key-hidden-in-Ciphertext

## Introduction:

> The Caesar cipher shifts all the letters in a piece of text by a certain number of places. The key for this cipher is a number which represents the number of places for the shift. So, for example, a key 3 means “shift 3 places” and a key 12 means “shift 12 places”. Note that a key 0 means “do not shift” and a key 25 can either mean “shift 25 places” or “shift one place backwards”. 

> ***For example***, the word “CEASER” with a shift 10 becomes “MOKCOB”<a name="_hlk75431326"></a>.

> Ceaser cipher is a ***symmetric encryption***, there is only one key, and all communicating parties use the same (secret) key for both encryption and decryption of the data. 

## Methodology:

> ***Ceaser cipher with key hidden in*** ***ciphertext*** is an ***8086-assembly language*** program, in which we perform the modified version Ceaser cipher. The modification is that we encrypt and hide the key itself somewhere in the Ciphertext. This ensures that only the person who has the same program that was used for encrypting the plaintext can decrypt the cipher text.

> The key can be hidden anywhere choose by us, it can be start, end, middle, or one digit in start and one digit at the end.

## Design:

> After creating the main structure of the program and dividing it in to two segments.

> - .data
> - .code

Where data segment is used for declaring initialized data or constants and the .code segment is used for keeping the actual code. Variables and constants declared in .data segment are,


|**Variable name**|**Purpose**|
| :-: | :-- |
|**str1**|For Output Display message|
|**Choicedisplay**|For Output Display message|
|**str2**|For Output Display message|
|**str3**|For Output Display message|
|**str4**|For Output Display message|
|**str5**|For Output Display message|
|**str6**|For Output Display message|
|**str7**|For Output Display message|
|**str8**|For Output Display message|
|**str9**|For Output Display message|
|**lbk**|For carriage return and newline.|
|**Inputstring**|For storing the input in the form of a string.|
|**Outputstring**|For storing the string later to be used as output.|
|**Keystring**|For storing the key as when it is entered it is stored in the string form.|
|**Strlen**|For storing the length of the input or output string.|
|**KeyStrlen**|For storing the length of the key string.|
|**Decimalpoint**|It is used in the string2number procedure.|
|**key**|For storing the key.|
|**bool** |For checking if the user wants to exit the program or not.|

![.data](Aspose.Words.cb64041c-7963-4b27-b6bf-9fe1b2d5f916.004.png) 

The Program has been divided into ***multiple procedures***, a series of actions conducted in a certain order or manner. The procedures are,

***Procedures:***

- main proc
- DisplayChoice proc
- EncryptEnterdata proc  
- DecryptEnterdata proc  
- <a name="_hlk75549363"></a>Enterkey proc  
- EncryptingFun proc  
- DecryptingFun proc
- movKeyToOutput proc  
- ExtractKey proc
- DisplayOutput proc
- string2number proc
- dollarsin proc
- dollarsout proc
- dollarskey proc  
- reset proc
- Restartprog proc

**main proc:**
**
`	`It is the procedure called when the program runs. The execution of the program begins with the ***main proc***, regardless of where the procedure is actually located within the code. It acts as the meat of a program, specifying its actual behavior. 

![](Aspose.Words.cb64041c-7963-4b27-b6bf-9fe1b2d5f916.005.png)***main proc*** in our program loads the variables specified in the ***.data*** segment of the program and calls the procedure ***DisplayChoice proc*** when ***check Module*** for ***restarting*** the program Turns out to be **True**.	

**DisplayChoice proc:**

The procedure ***DisplayChoice proc*** is used for displaying initialized string variables named ***str1***, ***str2***, ***str3***, ***str4*** and ***Choicedisplay*** on to **command window,** take input of the choices displayed on the command screen and Call procedures accordingly.

![](Aspose.Words.cb64041c-7963-4b27-b6bf-9fe1b2d5f916.006.png)

![](Aspose.Words.cb64041c-7963-4b27-b6bf-9fe1b2d5f916.007.png)


**EncryptEnterdata proc:**  

![](Aspose.Words.cb64041c-7963-4b27-b6bf-9fe1b2d5f916.008.png)The procedure ***EncryptEnterdata proc*** is called when the user selects the choice to encrypt. The procedure on run intakes the string to be encrypted, from the user. If the user enters no string and hits enter. The program jumps to the start of the procedure and asks the user to re-enter the string. The procedure stores the string in an Array variable ***Inputstring***.

**DecryptEnterdata proc:**  

![](Aspose.Words.cb64041c-7963-4b27-b6bf-9fe1b2d5f916.009.png)The procedure ***DecryptEnterdata proc*** is called when the user selects the choice to decrypt. The procedure on run intakes the string to be decrypted, from the user. If the user enters no string and hits enter. The program jumps to the start of the procedure and asks the user to re-enter the string. The procedure stores the string in an Array variable ***Inputstring***.

**Enterkey proc:**

This procedure is used to take the key from the user in the form of two-character string and then storing it in the ***Keystring*** variable. then the procedure calls ***string2number proc*** procedure to convert the key from string into a two-digit number.![](Aspose.Words.cb64041c-7963-4b27-b6bf-9fe1b2d5f916.010.png)

**EncryptingFun proc:**  

This function starts with calling ***EncryptEnterdata proc*** procedure for getting the ***inputstring***/plaintext from the user. Then it goes on to call ***Enterkey proc*** procedure for getting the key from the user**.** Procedure then calls ***movKeyToOutput proc*** which encrypts the key and then stores it in the first two places of the string**.** The procedure then traverses the ***inputstring*** and encrypts by shifting the ASCII code of alphabets only (from ASCII  65 to 90 and 97 to 122) according to the key entered, and then stored the shifted alphabet in the ***outputstring***. The procedure ignores anything other than the ASCII code of alphabets. 

![](Aspose.Words.cb64041c-7963-4b27-b6bf-9fe1b2d5f916.011.png)

![](Aspose.Words.cb64041c-7963-4b27-b6bf-9fe1b2d5f916.012.png)

**DecryptingFun proc:**

This function starts when calling ***DecryptEnterdata proc*** Procedure for getting the already encrypted or ciphertext from the user. Then it goes on to ***ExtractKey proc*** procedure which extract the key from the first two elements of the ciphertext and then decrypts it and stores it in **Key.** The procedure then traverses the ciphertext and decrease is by shifting the ASCII code the other way of alphabets only (from ASCII  65 to 90 and 97 to 122) according to the key extracted from the ciphertext. This procedure also ignores anything other than the ASCII code of alphabets.

![](Aspose.Words.cb64041c-7963-4b27-b6bf-9fe1b2d5f916.013.png)

![](Aspose.Words.cb64041c-7963-4b27-b6bf-9fe1b2d5f916.014.png)

**movKeyToOutput proc:**  

This procedure takes the key string which is in digits and then encrypts it into alphabets and then stores (embeds) them as the first two elements of the ***outputstring***.

It encrypts the digits according to the following table.

|Before encryption|0|1|2|3|4|5|6|7|8|9|
| :- | :- | :- | :- | :- | :- | :- | :- | :- | :- | :- |
|After encryption|a|b|c|d|e|f|g|h|i|j|


**ExtractKey proc:**

When the user enters the ciphertext to be decrypted this procedure extracts the key from the first two elements of the ciphertext which is in encrypted form, the procedure decreases the key from alphabets back into digit form, and then stores them in **KeyStrlen**. then this procedure calls ***string2number proc*** to convert the key from character to numeric form. 

It decrypts the alphabets according to the following table.


|Before decryption|a|b|c|d|e|f|g|h|i|j|
| :- | :- | :- | :- | :- | :- | :- | :- | :- | :- | :- |
|After decryption|0|1|2|3|4|5|6|7|8|9|


**DisplayOutput proc:**

This procedure is used to display the contents of the ***Outputstring.***

![](Aspose.Words.cb64041c-7963-4b27-b6bf-9fe1b2d5f916.015.jpeg)

**string2number proc:**

This procedure is used to convert the ***key*** which is stored in ***Keystring*** in the form of a string into a number and then storing it in the key variable. It iterates a maximum of two times because the maximum number of digits a key can be is two. It also uses stack and some arithmetic operations to convert from string to number.

![](Aspose.Words.cb64041c-7963-4b27-b6bf-9fe1b2d5f916.016.jpeg)

**Restartprog proc:**

The procedure ***Restartprog proc*** is called when the user complete one task of the program that he/she selected to perform. So, this program further calls other procedures like, 

- **dollarsin proc**
- **dollarsout proc**
- **dollarskey proc**
- **reset proc**

The above procedures when called by the ***Restartprog proc*** they reset the values of registers back to zero and other variables and constants to there default values.*** 

![](Aspose.Words.cb64041c-7963-4b27-b6bf-9fe1b2d5f916.017.png)

1. **Conclusion:**

The program encrypts the Input string in to cipher text.



**--------------------------------**

***THE END***

|**Submitted By**       |**Registration no**|
| :- | :- |
|Muhammad Hamza Fayyaz|19-CS-20|
|Muhammad Abdullah Zahid|19-CS-54|
