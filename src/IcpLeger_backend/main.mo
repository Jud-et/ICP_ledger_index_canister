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


//send icp tokens to another account from he balance

public func sendICP(recepient:Text, amt:Nat) :async Result.Result<(), Text>{

try{
  let transferResults = await ICPledger.icrc1_transfer({
    to= {
      owner=Principal.fromText(recepient);
      subaccount=null;

      };
      amount=amt;
      fee=null;
      memo=null;
      from_subaccount=null;
      created_at_time=null;

  });

  switch(transferResults) {
  case(#Ok(results)) { 
    return #ok();
   };
  case(#Err(error)) {
    return #err("Error in transfering tokens");
   };
};



}catch(error){
  return #err(Error.message(error))
}

};


};
