

package body PackageDemo_B is
  procedure T(M: in Integer; Z: out Integer) is
  begin
    PackageDemo_A.Q(M, Z);
  end T;
end PackageDemo_B;
