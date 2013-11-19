-- NeoSpark Model Type for sets over the mathematical integers.
--
-- @author Patrice Chalin, DSRG.org

with NeoSpark_Base;
  --# inherit NeoSpark_Base;
package NeoSpark_Z_Set
is
	type Z_Set is array(NeoSpark_Base.Z) of Boolean;
	
	function isMember(E: NeoSpark_Base.Z; S: Z_Set) return Boolean;
	function isEmpty(S: Z_Set) return Boolean;
	function Size(S: Z_Set) return Natural;

  procedure Add(E: in NeoSpark_Base.Z; S: in out Z_Set);
  --# derives S from E, S;
	
  procedure Empty(S : out Z_Set);
  --# derives S from;
	
end NeoSpark_Z_Set;