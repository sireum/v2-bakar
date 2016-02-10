--type  Domains is (Public, Secret, TopSecret) with Ordered;
type  Domains is (Public, Secret, TopSecret, Section0, Section1, Scrubbed, Encrypted) with Ordered 
  => {Public <= Secret, Secret <= TopSecret, Public <= TopSecret, Encrypted <= Public};

low1: Integer with Domain => Public;
low2: Integer with Domain => Public;

low: Integer with Domain => Public;
high: Integer with Domain => Secret;
top: Integer with Domain => TopSecret;  
    
Password: Integer with Domain => Secret;
Display: String with Domain => Public;

Key: Integer with Domain => Secret;
SSN: Integer with Domain => Secret;
BankAccount: Integer with Domain => TopSecret;
Disk: Integer with Domain => Public;
    
IN_0_DAT : Integer with Domain => Section0;
OUT_1_DAT : Integer with Domain => Section1; 
    
procedure Encrypt(K: in Integer; V: in Integer; R: out Integer) with
  Declassifier,
  Domain => (K => Secret, V => Secret, R => Public);

procedure Filter_And_Clean(X: in Integer; Y: out Integer) with
  Declassifier,
  Domain => (X => TopSecret, Y => Public);

procedure Declassifier_TopSecret_Secret(X: in Integer; Y: out Integer) with
  Declassifier,
  Domain => (X => TopSecret, Y => Secret);
   
procedure Declassifier_Secret_Public(X: in Integer; Y: out Integer) with
  Declassifier,
  Domain => (X => Secret, Y => Public);

procedure PasswordMatch(UserInput: in Integer; Result: out Boolean) with
   Declassifier,
   Domain => (UserInput => Secret, Result => Public);      

procedure Scrub(V: in Integer; R: out Integer) with
   Declassifier,
   Domain => (V => Section0, R => Scrubbed);
   
procedure Encrypt1(V: in Integer; R: out Integer) with
   Declassifier,
   Domain => (V => Scrubbed, R => Encrypted);
