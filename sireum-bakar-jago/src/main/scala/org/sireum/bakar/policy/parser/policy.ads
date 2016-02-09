type  Domains is (Public, Secret, TopSecret) with Ordered;

low1: Integer with Domain => Public;
low2: Integer with Domain => Public;

low: Integer with Domain => Public;
high: Integer with Domain => Secret;
top: Integer with Domain => TopSecret;    

Key: Integer with Domain => Secret;
SSN: Integer with Domain => Secret;
BankAccount: Integer with Domain => TopSecret;
Disk: Integer with Domain => Public;

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
