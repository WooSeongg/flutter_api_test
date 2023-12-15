import 'dart:convert';
import 'package:flutter_api_test/common/Keys.dart';
import 'package:flutter_api_test/common/RequestApi.dart';
import 'package:http/http.dart' as http;
import 'dart:io';

/// /////////////////////// ///
///한국투자증권 주식잔고조회 API///
/// ////////////////////// ///
class TR8434 {
  String sunAmt = "0";     //순자산 금액
  String deposit = "0";    // 추정D+2예수금
  String evalAmt = "0";    // 평가금액
  String evalProfit = "0"; // 평가손익금액
  String buyAmt = "0";     // 매입금액

  TR8434(this.sunAmt, this.deposit, this.evalAmt, this.evalProfit, this.buyAmt);

  setTR8434(TR8434 item) {
    this.sunAmt = item.sunAmt;
    this.deposit = item.deposit;
    this.evalAmt = item.evalAmt;
    this.evalProfit = item.evalProfit;
    this.buyAmt = item.buyAmt;
  }

  /// Json -> TR8434
  factory TR8434.fromJSON(Map<String, dynamic> json) {
    var output1 = json["output1"][0];
    var output2 = json["output2"][0];

    return TR8434(
        (output2["nass_amt"] as String).trim(),
        (output2["prvs_rcdl_excc_amt"] as String).trim(),
        (output2["nass_amt"] as String).trim(),
        (output1["evlu_pfls_amt"] as String).trim(),
        (output1["pchs_amt"] as String).trim());
  }
}

Future<TR8434> fetchTR8434() async {

  Uri uri = Uri(
    scheme: 'https',
    host: 'openapivts.koreainvestment.com',
    port: 29443,
    path: '/uapi/domestic-stock/v1/trading/inquire-balance',
    queryParameters: {
      'CANO': "${Keys.HKT_ACC_NUM}",
      'ACNT_PRDT_CD': "${Keys.HKT_ACC_TYPE}",
      'AFHR_FLPR_YN': 'N',
      'OFL_YN': '',
      'INQR_DVSN': '02',
      'UNPR_DVSN': '01',
      'FUND_STTL_ICLD_YN': 'N',
      'FNCG_AMT_AUTO_RDPT_YN': 'N',
      'PRCS_DVSN': '00',
      'CTX_AREA_FK100': '',
      'CTX_AREA_NK100': '',
    },
  );

  Map<String, String> headers = {
    "appkey": Keys.HKT_APP_KEY,
    "appsecret": Keys.HKT_SECRET_KEY,
    "authorization":
    "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJ0b2tlbiIsImF1ZCI6Ijk0YjRlY2Y5LTRjODYtNGY2Ny05OThmLTllNzM5YzU3MzRmMSIsImlzcyI6InVub2d3IiwiZXhwIjoxNzAyNjg3NzIwLCJpYXQiOjE3MDI2MDEzMjAsImp0aSI6IlBTcnptb09MempLQmkwUFljZEpTSUtuTEllVkk3bk9jT3ZkTyJ9.w_ChtT4DYVhGVqE_FNDMkj-OD8cTzO7k4YZCfwISjJGOYqK2OVC9hlza5jrp74c-M6rLe9-5k8I-WUiC1935cw",
    "tr_id": "VTTC8434R", //모의투자 계좌용 TR
  };

  var json = await requestAPI(uri, httpMethod: HttpMethod.get, header: headers);

  return TR8434.fromJSON(json);
}
