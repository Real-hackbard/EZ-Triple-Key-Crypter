# EZ-Triple-Key-Crypter:

</br>

![Compiler](https://github.com/user-attachments/assets/a916143d-3f1b-4e1f-b1e0-1067ef9e0401) &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: ![10 Seattle](https://github.com/user-attachments/assets/c70b7f21-688a-4239-87c9-9a03a8ff25ab) ![10 1 Berlin](https://github.com/user-attachments/assets/bdcd48fc-9f09-4830-b82e-d38c20492362) ![10 2 Tokyo](https://github.com/user-attachments/assets/5bdb9f86-7f44-4f7e-aed2-dd08de170bd5) ![10 3 Rio](https://github.com/user-attachments/assets/e7d09817-54b6-4d71-a373-22ee179cd49c)   
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;![10 4 Sydney](https://github.com/user-attachments/assets/e75342ca-1e24-4a7e-8fe3-ce22f307d881) ![11 Alexandria](https://github.com/user-attachments/assets/64f150d0-286a-4edd-acab-9f77f92d68ad) ![12 Athens](https://github.com/user-attachments/assets/59700807-6abf-4e6d-9439-5dc70fc0ceca)  
![Components](https://github.com/user-attachments/assets/d6a7a7a4-f10e-4df1-9c4f-b4a1a8db7f0e) : ![None](https://github.com/user-attachments/assets/30ebe930-c928-4aaf-a8e1-5f68ec1ff349)  
![Discription](https://github.com/user-attachments/assets/4a778202-1072-463a-bfa3-842226e300af) &nbsp;&nbsp;: ![EZ Triple Key Crypter](https://github.com/user-attachments/assets/ea1d3640-5ed6-465e-bc6b-3ef7dd08ccb8)  
![Last Update](https://github.com/user-attachments/assets/e1d05f21-2a01-4ecf-94f3-b7bdff4d44dd) &nbsp;: ![102025](https://github.com/user-attachments/assets/62cea8cc-bd7d-49bd-b920-5590016735c0)  
![License](https://github.com/user-attachments/assets/ff71a38b-8813-4a79-8774-09a2f3893b48) &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: ![Freeware](https://github.com/user-attachments/assets/1fea2bbf-b296-4152-badd-e1cdae115c43)

</br>

A "triple key crypter" typically refers to the Triple Data Encryption Standard (3DES), a [symmetric encryption algorithm](https://en.wikipedia.org/wiki/Symmetric-key_algorithm) that applies the DES algorithm three times for increased security. It uses two or three keys for the encryption-decryption-encryption (EDE) process. Although more secure than the original DES, 3DES is considered slow compared to more modern algorithms like [AES](https://en.wikipedia.org/wiki/Advanced_Encryption_Standard).

</br>

![EZ](https://github.com/user-attachments/assets/e993b4b3-c7cf-4142-aa23-2d6f2ff5beb3)

</br>

### How it works:
* Encryption process (EDE): The algorithm applies the DES encryption process in the order of encrypt, decrypt, encrypt.
  * Plaintext is encrypted with the first key (K1).
  * The result is decrypted with the second key (K2).
  * The last step is to encrypt the result with the third key (K3).
* Key:
  * Either two or three keys are used.
  * When using three keys (K1,K2,K3), the effective key length is (168) bits (3 times 56) bits, since DES has a (64)-bit key, of which (56) are actually used).
  * When using two keys (K1,K2), the process is performed as (E(K1),D(K2),E(K1).

### Strengths and Weaknesses
* Strengths:
    * Significantly more secure than the original DES algorithm.
    * Has long been a common standard for encrypting sensitive data.

### Weaknesses:
* Significantly slower than more modern algorithms such as AES.
    * Has been deprecated by NIST.
    * Current Status
    * Due to its weaknesses and the existence of faster alternatives, 3DES is now considered deprecated and is no longer recommended for new applications.
    * However, it remains an important part of cryptography history and is still in use in some legacy systems.

</br>

NIST (and the current TCG specifications version 2.0 of approved algorithms for [Trusted Platform Module](https://en.wikipedia.org/wiki/Trusted_Platform_Module)) also disallows using any one of the 64 following 64-bit values in any keys (note that 32 of them are the binary complement of the 32 others; and that 32 of these keys are also the reverse permutation of bytes of the 32 others), listed here in hexadecimal (in each byte, the least significant bit is an odd-parity generated bit, which is discarded when forming the effectively 56-bit key):

```
01.01.01.01.01.01.01.01, FE.FE.FE.FE.FE.FE.FE.FE, E0.FE.FE.E0.F1.FE.FE.F1, 1F.01.01.1F.0E.01.01.0E,
01.01.FE.FE.01.01.FE.FE, FE.FE.01.01.FE.FE.01.01, E0.FE.01.1F.F1.FE.01.0E, 1F.01.FE.E0.0E.01.FE.F1,
01.01.E0.E0.01.01.F1.F1, FE.FE.1F.1F.FE.FE.0E.0E, E0.FE.1F.01.F1.FE.0E.01, 1F.01.E0.FE.0E.01.F1.FE,
01.01.1F.1F.01.01.0E.0E, FE.FE.E0.E0.FE.FE.F1.F1, E0.FE.E0.FE.F1.FE.F1.FE, 1F.01.1F.01.0E.01.0E.01,
01.FE.01.FE.01.FE.01.FE, FE.01.FE.01.FE.01.FE.01, E0.01.FE.1F.F1.01.FE.0E, 1F.FE.01.E0.0E.FE.01.F1,
01.FE.FE.01.01.FE.FE.01, FE.01.01.FE.FE.01.01.FE, E0.01.01.E0.F1.01.01.F1, 1F.FE.FE.1F.0E.FE.FE.0E,
01.FE.E0.1F.01.FE.F1.0E, FE.01.1F.E0.FE.01.0E.F1, E0.01.1F.FE.F1.01.0E.FE, 1F.FE.E0.01.0E.FE.F1.01,
01.FE.1F.E0.01.FE.0E.F1, FE.01.E0.1F.FE.01.F1.0E, E0.01.E0.01.F1.01.F1.01, 1F.FE.1F.FE.0E.FE.0E.FE,
01.E0.01.E0.01.F1.01.F1, FE.1F.FE.1F.FE.0E.FE.0E, E0.1F.FE.01.F1.0E.FE.01, 1F.E0.01.FE.0E.F1.01.FE,
01.E0.FE.1F.01.F1.FE.0E, FE.1F.01.E0.FE.0E.01.F1, E0.1F.01.FE.F1.0E.01.FE, 1F.E0.FE.01.0E.F1.FE.01,
01.E0.E0.01.01.F1.F1.01, FE.1F.1F.FE.FE.0E.0E.FE, E0.1F.1F.E0.F1.0E.0E.F1, 1F.E0.E0.1F.0E.F1.F1.0E,
01.E0.1F.FE.01.F1.0E.FE, FE.1F.E0.01.FE.0E.F1.01, E0.1F.E0.1F.F1.0E.F1.0E, 1F.E0.1F.E0.0E.F1.0E.F1,
01.1F.01.1F.01.0E.01.0E, FE.E0.FE.E0.FE.F1.FE.F1, E0.E0.FE.FE.F1.F1.FE.FE, 1F.1F.01.01.0E.0E.01.01,
01.1F.FE.E0.01.0E.FE.F1, FE.E0.01.1F.FE.F1.01.0E, E0.E0.01.01.F1.F1.01.01, 1F.1F.FE.FE.0E.0E.FE.FE,
01.1F.E0.FE.01.0E.F1.FE, FE.E0.1F.01.FE.F1.0E.01, E0.E0.1F.1F.F1.F1.0E.0E, 1F.1F.E0.E0.0E.0E.F1.F1,
01.1F.1F.01.01.0E.0E.01, FE.E0.E0.FE.FE.F1.F1.FE, E0.E0.E0.E0.F1.F1.F1.F1, 1F.1F.1F.1F.0E.0E.0E.0E
```















