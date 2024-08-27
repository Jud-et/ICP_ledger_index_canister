import ICPledger "canister:icp_ledger_canister";
import Result "mo:base/Result";
import Nat "mo:base/Error";
import Error "mo:base/Error";
import Principal "mo:base/Principal";

actor {
  
//get principal id from the backend
public func getBalanceFromLedger(user:Text) : async Result.Result<Nat, Text>{

try{

let results = await  ICPledger.icrc1_balance_of({
owner= Principal.fromText(user);
subaccount=null;
});
return #ok(results);

}catch(error){
  return #err(Error.message(error))
}

};


};
