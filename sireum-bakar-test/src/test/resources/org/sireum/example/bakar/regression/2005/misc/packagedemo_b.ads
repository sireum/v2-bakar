with PackageDemo_A;
--# inherit PackageDemo_A;
package PackageDemo_B is
  procedure T(M: in Integer; Z: out Integer);
  --# derives Z from M;
end PackageDemo_B;
