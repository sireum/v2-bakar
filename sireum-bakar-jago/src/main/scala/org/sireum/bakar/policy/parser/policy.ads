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
