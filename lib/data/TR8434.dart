/// /////////////////////// ///
///한국투자증권 주식잔고조회 API///
/// ////////////////////// ///
class TR8434{

  String sunAmt = "";         //순자산 금액
  String deposit = "0";       // 추정D+2예수금
  String evalAmt = "0";       // 평가금액 evlu_amt
  String evalProfit = "0";    // 평가손익금액 evlu_pfls_amt
  String buyAmt = "0";        // 매입금액 pchs_amt

  TR8434(this.sunAmt, this.deposit, this.evalAmt, this.evalProfit, this.buyAmt);

  setTR8434(TR8434 item) {
    this.sunAmt = item.sunAmt;
    this.deposit = item.deposit;
    this.evalAmt = item.evalAmt;
    this.evalProfit = item.evalProfit;
    this.buyAmt = item.buyAmt;
  }

  /// Json -> TR8434
  factory TR8434.fromJSON(Map<String, dynamic> json){
    return TR8434(
        (json["nass_amt"] as String).trim(),
        (json["prvs_rcdl_excc_amt"] as String).trim(),
        (json["nass_amt"] as String).trim(),
        (json["evlu_pfls_amt"] as String).trim(),
        (json["pchs_amt"] as String).trim()
    );
  }

}