import 'package:flutter/material.dart';
import 'package:payu_custom_browser_flutter/payu_custom_browser_flutter.dart';
import 'package:payu_custom_browser_flutter/PayUCBConstantKeys.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';

void main() {
  runApp(const MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> implements PayuCustomBrowserProtocol {

  late PayuCustomBrowserFlutter payUCustomBrowserFlutterPlugin;
  TextEditingController keyTextField = TextEditingController(text:"smsplus");
  TextEditingController saltTextField = TextEditingController(text:"1b1b0");
  TextEditingController userCredentialTextField = TextEditingController(text:"umang:arya");
  TextEditingController accountNumberTextField = TextEditingController(text:"02941050067357");
  TextEditingController accountIFSCTextField = TextEditingController(text:"HDFC0000294");
  TextEditingController bankCodeForNBTextField = TextEditingController(text:"ICIB");
  TextEditingController bankCodeForNBTPVTextField  = TextEditingController(text:"HDFNBTPV");
  TextEditingController phoneTextField  = TextEditingController(text:"123456789");

  @override
  void initState() {
    super.initState();
    payUCustomBrowserFlutterPlugin = PayuCustomBrowserFlutter(this);
    PayUTestCredentials.merchantKey = keyTextField.text;
    PayUTestCredentials.merchantSalt = saltTextField.text;
    PayUTestCredentials.userCredential = userCredentialTextField.text;
    PayUTestCredentials.accountNumber = accountNumberTextField.text;
    PayUTestCredentials.accountIFSC = accountIFSCTextField.text;
    PayUTestCredentials.bankCodeForNB = bankCodeForNBTextField.text;
    PayUTestCredentials.bankCodeForNBTPV = bankCodeForNBTPVTextField.text;
    PayUTestCredentials.phone = phoneTextField.text;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Custom Browser Plugin example app'),
        ),
        body: Center(
            child: SizedBox(
                child: ListView(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Container(
                              margin: const EdgeInsets.only(
                                  top: 10.0, bottom: 10.0),
                              height: 50,
                              child: TextField(
                                controller: accountNumberTextField,
                                decoration: const InputDecoration(
                                  labelText: 'account number ',
                                  contentPadding: EdgeInsets.all(8),
                                  border: OutlineInputBorder(),
                                ),
                                style: Theme.of(context).textTheme.bodyText1,
                                onChanged: (content) {
                                  PayUTestCredentials.accountNumber =
                                      accountNumberTextField.text;
                                  print("PayU flutterhash " +
                                      PayUTestCredentials.merchantKey);
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Container(
                              margin: const EdgeInsets.only(
                                  top: 10.0, bottom: 10.0),
                              height: 50,
                              child: TextField(
                                controller: accountIFSCTextField,
                                decoration: const InputDecoration(
                                  labelText: 'account IFSC ',
                                  contentPadding: EdgeInsets.all(8),
                                  border: OutlineInputBorder(),
                                ),
                                style: Theme.of(context).textTheme.bodyText1,
                                onChanged: (content) {
                                  PayUTestCredentials.accountIFSC =
                                      accountIFSCTextField.text;
                                  print("PayU flutterhash " +
                                      PayUTestCredentials.merchantKey);
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Container(
                              margin: const EdgeInsets.only(
                                  top: 10.0, bottom: 10.0),
                              height: 50,
                              child: TextField(
                                controller: userCredentialTextField,
                                decoration: const InputDecoration(
                                  labelText: 'User Credential ',
                                  contentPadding: EdgeInsets.all(8),
                                  border: OutlineInputBorder(),
                                ),
                                style: Theme.of(context).textTheme.bodyText1,
                                onChanged: (content) {
                                  PayUTestCredentials.userCredential =
                                      userCredentialTextField.text;
                                  print("PayU flutterhash " +
                                      PayUTestCredentials.merchantKey);
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Container(
                              margin: const EdgeInsets.only(
                                  top: 10.0, bottom: 10.0),
                              height: 50,
                              child: TextField(
                                controller: keyTextField,
                                decoration: const InputDecoration(
                                  labelText: 'Key ',
                                  contentPadding: EdgeInsets.all(8),
                                  border: OutlineInputBorder(),
                                ),
                                style: Theme.of(context).textTheme.bodyText1,
                                onChanged: (content) {
                                  PayUTestCredentials.merchantKey =
                                      keyTextField.text;
                                  print("PayU flutterhash " +
                                      PayUTestCredentials.merchantKey);
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Container(
                              margin: const EdgeInsets.only(
                                  top: 10.0, bottom: 10.0),
                              height: 50,
                              child: TextField(
                                controller: saltTextField,
                                decoration: const InputDecoration(
                                  labelText: 'Salt ',
                                  contentPadding: EdgeInsets.all(8),
                                  border: OutlineInputBorder(),
                                ),
                                style: Theme.of(context).textTheme.bodyText1,
                                onChanged: (content) {
                                  PayUTestCredentials.merchantSalt =
                                      saltTextField.text;
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Container(
                              margin: const EdgeInsets.only(
                                  top: 10.0, bottom: 10.0),
                              height: 50,
                              child: TextField(
                                controller: bankCodeForNBTextField,
                                decoration: const InputDecoration(
                                  labelText: 'bankCodeForNB ',
                                  contentPadding: EdgeInsets.all(8),
                                  border: OutlineInputBorder(),
                                ),
                                style: Theme.of(context).textTheme.bodyText1,
                                onChanged: (content) {
                                  PayUTestCredentials.bankCodeForNB =
                                      bankCodeForNBTextField.text;
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Container(
                              margin: const EdgeInsets.only(
                                  top: 10.0, bottom: 10.0),
                              height: 50,
                              child: TextField(
                                controller: bankCodeForNBTPVTextField,
                                decoration: const InputDecoration(
                                  labelText: 'bankCodeForNBTPV ',
                                  contentPadding: EdgeInsets.all(8),
                                  border: OutlineInputBorder(),
                                ),
                                style: Theme.of(context).textTheme.bodyText1,
                                onChanged: (content) {
                                  PayUTestCredentials.bankCodeForNBTPV =
                                      bankCodeForNBTPVTextField.text;
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Container(
                              margin: const EdgeInsets.only(
                                  top: 10.0, bottom: 10.0),
                              height: 50,
                              child: TextField(
                                controller: phoneTextField,
                                decoration: const InputDecoration(
                                  labelText: 'Phone number ',
                                  contentPadding: EdgeInsets.all(8),
                                  border: OutlineInputBorder(),
                                ),
                                style: Theme.of(context).textTheme.bodyText1,
                                onChanged: (content) {
                                  PayUTestCredentials.phone =
                                      phoneTextField.text;
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          ElevatedButton(
                            child: const Text("Pay Via CC"),
                            onPressed: () {
                              payViaCC();
                            },
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          ElevatedButton(
                            child: const Text("Pay Via NB"),
                            onPressed: () {
                              payViaNB();
                            },
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          ElevatedButton(
                            child: const Text("Pay Via TPV NB"),
                            onPressed: () {
                              payViaTPVNB();
                            },
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          ElevatedButton(
                            child: const Text("Pay via Wallet"),
                            onPressed: () {
                              payViaWallet();
                            },
                          ),
                        ],
                      ),
                    ]))),
      ),
    );
  }

  showAlertDialog(BuildContext context, String title, String content) {
    Widget okButton = TextButton(
      child: const Text("OK"),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Text(content),
            ),
            actions: [okButton],
          );
        });
  }


  payViaCC() async {
    var params = PayUParams.createCCParams();
    var data = await payUCustomBrowserFlutterPlugin.openCB(params: params);
    showAlertDialog(context, "CARDS", "$data");
  }

  payViaNB() async {
    var params = PayUParams.createPayUPaymentParams(
        PayUTestCredentials.bankCodeForNB, "NB");
    params["user_credentials"] = PayUTestCredentials.userCredential;
    var data = await payUCustomBrowserFlutterPlugin.openCB(params: params);
    showAlertDialog(context, "Net Banking", "$data");
  }

  payViaTPVNB() async {
      var params = PayUParams.createTPVPayUPaymentParams(
          PayUTestCredentials.bankCodeForNBTPV, "NB");
      var data = await payUCustomBrowserFlutterPlugin.openCB(params: params);
      showAlertDialog(context, "Net Banking TPV", "$data");
    }

  payViaWallet() async {
    var params = PayUParams.createPayUPaymentParams(
        PayUTestCredentials.walletId, "CASH");
    var data = await payUCustomBrowserFlutterPlugin.openCB(params: params);
    print("payViaWallet response $data");
    showAlertDialog(context, "payViaWallet", "$data");
  }

  @override
  onPayUCBResponse(Map response) {

    String eventType = response[PayUEventType.eventType];
    switch(eventType) {
      case PayUEventType.onPaymentSuccess: {
        String eventResponse = parsePayUResponse(response);
        showAlertDialog(context,PayUEventType.onPaymentSuccess,eventResponse);
      }
      break;
      case PayUEventType.onPaymentFailure: {
        String eventResponse = parsePayUResponse(response);
        showAlertDialog(context,PayUEventType.onPaymentFailure,eventResponse);
      }
      break;

      case PayUEventType.onBackButton: {
        String eventResponse = parsePayUResponse(response);
        showAlertDialog(context,PayUEventType.onBackButton,eventResponse);
      }
      break;

      case PayUEventType.onPaymentTerminate:
        {
          String eventResponse = parsePayUResponse(response);
          showAlertDialog(context,PayUEventType.onPaymentTerminate,eventResponse);
        }
        break;

      default: {
        showAlertDialog(context,PayUEventType.invalidEvent,"");
      }
      break;
    }
  }

  String parsePayUResponse(Map response){
    var eventResponse = response[PayUEventType.eventResponse];
    return eventResponse != null ? eventResponse.toString() : "";
  }

}

class PayUTestCredentials {
  static String merchantKey = ""; //TODO: Add Merchant Key
  static String merchantSalt = "";  //TODO: Keep salt in your backend.
  static const sUrl = "https://cbjs.payu.in/sdk/success"; //TODO: Add Success URL.
  static const fUrl = "https://cbjs.payu.in/sdk/failure"; //TODO: Add Failure URL.

  static const udf1 = "udf1";
  static const udf2 = "udf2";
  static const udf3 = "udf3";
  static const udf4 = "udf4";
  static const udf5 = "udf5";

  static const amount = "1";
  static const productInfo = "Info";
  static const firstName = "Abc";
  static const email = "test@gmail.com";
  static String phone = "7503829146";

  static const _paymentUrl =
      "https://secure.payu.in/_payment"; //'https://test.payu.in/_payment';

  static String bankCodeForNB = '';
  static String bankCodeForNBTPV = "";//"AXNBTPV";

  static String accountNumber = "";
  static String accountIFSC = "";
  static String userCredential = "";

  static const walletId = 'AMON';
  static const ccnum = '00000000000000';  //TODO: Remove it
  static const cvv = '000';  //TODO: Remove it
  static const ccexpyr = '2023';  //TODO: Remove it
  static const ccexpmon = '11';  //TODO: Remove it
  static const ccname = 'PayuUser';

  static var siParams = {
    PayUSIParamsKeys.beneficiarydetail: {
      PayUSIBeneDetailsKeys.beneficiaryAccountNumber:
      PayUTestCredentials.accountNumber,
      PayUSIBeneDetailsKeys.beneficiary_ifsc:
      PayUTestCredentials.accountIFSC,
      PayUSIBeneDetailsKeys.beneficiaryName: 'Name',
      PayUSIBeneDetailsKeys.beneficiaryAccountType:
      "0" // 1 for CURRENT ,0 for Saving
    },
    PayUPaymentParamKey.si_details: {
      PayUSIParamsKeys.billingAmount: "1.00",
      PayUSIParamsKeys.billingCurrency: "INR",
      PayUSIParamsKeys.billingCycle:
      "DAILY", // YEARLY | MONTHLY | WEEKLY | DAILY | ONCE | ADHOC
      PayUSIParamsKeys.billingInterval: "1",
      PayUSIParamsKeys.paymentEndDate: "2023-12-12", // YYYY-MM-DD
      PayUSIParamsKeys.paymentStartDate: "2022-12-12" // YYYY-MM-DD
    },
    PayUSIParamsKeys.cc_card_type: "VISA",
    PayUSIParamsKeys.cc_category: "CC", // DC | CC
    PayUSIParamsKeys.is_free_trial: "0", // 1 | 0 (true | false)
    PayUSIParamsKeys.si: "1"
  };
}

//Pass these values from your app to SDK, this data is only for test purpose
class PayUParams {
  //Don't use this method get the hash from your backend.

  static Map createCCParams() {
    var params = PayUParams.createPayUPaymentParams("CC", "CC");
    params["user_credentials"] = PayUTestCredentials.userCredential;
    var cbConfig = params["cb_config"];

    cbConfig["post_data"] = cbConfig["post_data"] +
        "&ccnum=" +
        PayUTestCredentials.ccnum +
        "&ccvv=" +
        PayUTestCredentials.cvv +
        "&ccexpyr=" +
        PayUTestCredentials.ccexpyr +
        "&ccexpmon=" +
        PayUTestCredentials.ccexpmon +
        "&ccname=" +
        PayUTestCredentials.ccname;
        params["cb_config"] = cbConfig;
        //bool isHash = true;
        // if (isHash){
        //   params["hashes"]["payment"] = HashService.getSIHash(PayUTestCredentials.siParams);
        // }
        // params[PayUPaymentParamKey.si_params] = PayUTestCredentials.siParams;
        return params;
  }

  static Map createTPVPayUPaymentParams(String bankCode, String paymentMode) {
    var txnId = DateTime.now().millisecondsSinceEpoch.toString(); //"1695658018703"
    var paymentHash = HashService.getTPVPaymentHash(txnId);
    var postData = getTPVPostData(txnId,paymentHash,paymentMode,bankCode) + "&beneficiarydetail=" + HashService.beneficiaryDetail();
    var payUPaymentParams = createCommonPayUPaymentParams(txnId,paymentMode,postData);
    payUPaymentParams[PayUPaymentParamKey.beneficiaryAccountNumber] =
        PayUTestCredentials.accountNumber;
    payUPaymentParams[PayUPaymentParamKey.ifscCode] = PayUTestCredentials.accountIFSC;
    // payUPaymentParams[PayUPaymentParamKey.user_credentials] = PayUTestCredentials.userCredential;
    return payUPaymentParams;
  }

  static Map createPayUPaymentParams(String bankCode, String paymentMode) {
    var txnId = DateTime.now().millisecondsSinceEpoch.toString();
    var paymentHash = HashService.getPaymentHash(txnId);
    var postData = getPostData(txnId,paymentHash,paymentMode,bankCode);
    var payUPaymentParams = createCommonPayUPaymentParams(txnId,paymentMode,postData);
    return payUPaymentParams;
  }

  static Map createCommonPayUPaymentParams(String txnId,String paymentMode,String postData) {

    var payUPaymentParams = {
      PayUPaymentParamKey.key: PayUTestCredentials.merchantKey,
      PayUPaymentParamKey.transaction_id: txnId,
      PayUPaymentParamKey.amount: PayUTestCredentials.amount,
      PayUPaymentParamKey.ios_surl: PayUTestCredentials.sUrl,
      PayUPaymentParamKey.ios_furl: PayUTestCredentials.fUrl,
      PayUPaymentParamKey.android_surl: PayUTestCredentials.sUrl,
      PayUPaymentParamKey.android_furl: PayUTestCredentials.fUrl,
      PayUPaymentParamKey.product_info: PayUTestCredentials.productInfo,
      PayUPaymentParamKey.cb_config: {
        PayUPaymentParamKey.first_name: PayUTestCredentials.firstName,
        PayUPaymentParamKey.email: PayUTestCredentials.email,
        PayUPaymentParamKey.phone: PayUTestCredentials.phone,
        PayUCBCOnfigKeys.url: PayUTestCredentials._paymentUrl,
        PayUCBCOnfigKeys.payment_type: paymentMode,
        PayUCBCOnfigKeys.auto_approve: true,
        PayUCBCOnfigKeys.auto_select_otp: "1",
        // PayUCBCOnfigKeys.html_data:getHTMLData(),
        PayUCBCOnfigKeys.merchant_response_timeout: 7,
        PayUCBCOnfigKeys.post_data : postData,
      }
    };
    print("PayU SDK  $payUPaymentParams");
    return payUPaymentParams;
  }

  static String getHTMLData(){
    return  "<html><body><form name=\"payment_post\" id=\"payment_post\" action=\"https://acssimuat.payubiz.in/pg/axis/axishome\" method=\"post\"><input type=\"hidden\" name=\"vpc_AccessCode\" value=\"9B23BD57\"><input type=\"hidden\" name=\"vpc_Amount\" value=\"100\"><input type=\"hidden\" name=\"vpc_CardExp\" value=\"3412\"><input type=\"hidden\" name=\"vpc_CardNum\" value=\"4111111111111111\"><input type=\"hidden\" name=\"vpc_CardSecurityCode\" value=\"123\"><input type=\"hidden\" name=\"vpc_Command\" value=\"pay\"><input type=\"hidden\" name=\"vpc_Currency\" value=\"INR\"><input type=\"hidden\" name=\"vpc_Gateway\" value=\"ssl\"><input type=\"hidden\" name=\"vpc_MerchTxnRef\" value=\"403993715527771141\"><input type=\"hidden\" name=\"vpc_Merchant\" value=\"IBIBOWEB\"><input type=\"hidden\" name=\"vpc_OrderInfo\" value=\"Nokia\"><input type=\"hidden\" name=\"vpc_ReturnURL\" value=\"https://test.payu.in/89ef813898df19dfef97178eb9d4300edf9e891581fb12cda66f7c9c126070ca/_axis_response.php\"><input type=\"hidden\" name=\"vpc_Version\" value=\"1\"><input type=\"hidden\" name=\"vpc_card\" value=\"Visa\"><input type=\"hidden\" name=\"vpc_SecureHash\" value=\"12F1D571CB679EAB269AF7BC1D565A9DC833F370B60CE36D868FC7856132F039\"><input type=\"hidden\" name=\"vpc_SecureHashType\" value=\"SHA256\"><input type=\"hidden\" name=\"Title\" value=\"MIGS 2.5 Party Transaction\"></form><script type=\'text/javascript\'>\n                            window.onload=function(){\n                                document.forms[\'payment_post\'].submit();\n                            }\n                        </script></body></html>";
  }

  static String getTPVPostData(String txnId, String paymentHash, String paymentMode, String bankCode){
    var postData = "${getPostData(txnId,paymentHash,paymentMode,bankCode)}&api_version=6";
    return postData;
  }

  static String getPostData(String txnId, String paymentHash, String paymentMode, String bankCode){
    var postData = "device_type=1&key=${Uri.encodeFull(PayUTestCredentials.merchantKey)}&txnid=${Uri.encodeFull(txnId)}&amount=${Uri.encodeFull(PayUTestCredentials.amount)}&productinfo=${Uri.encodeFull(PayUTestCredentials.productInfo)}&firstname=${Uri.encodeFull(PayUTestCredentials.firstName)}&email=${Uri.encodeFull(PayUTestCredentials.email)}&surl=${Uri.encodeFull(PayUTestCredentials.sUrl)}&furl=${Uri.encodeFull(PayUTestCredentials.fUrl)}&hash=${Uri.encodeFull(paymentHash)}&udf1=udf1&udf2=udf2&udf3=udf3&udf4=udf4&udf5=udf5&phone=${Uri.encodeFull(PayUTestCredentials.phone)}&pg=${Uri.encodeFull(paymentMode)}&bankcode=${Uri.encodeFull(bankCode)}";
    return postData;
  }
}

class HashService{

  static String getPaymentHash(String txnId) {
    var paymentHash = HashService.calculateHash(
        '${HashService.paymentHashString(txnId)}|${PayUTestCredentials.merchantSalt}');
    return paymentHash;
  }

  static String getTPVPaymentHash(String txnId) {
    var paymentHash = HashService.calculateHash(
        '${paymentHashString(txnId)}|${beneficiaryDetail()}|${PayUTestCredentials.merchantSalt}');
    return paymentHash;
  }

  static String getSIHash(Map siParams) {
    var txnId = DateTime.now().millisecondsSinceEpoch.toString();

    String hashString = '${HashService.paymentHashString(txnId)}|${PayUTestCredentials.merchantSalt}';
//  String hashString = '${HashService.paymentHashString(txnId)}|${JSON.stringify(si_details)}|${PayUTestCredentials.merchantSalt}'

    var paymentHash = HashService.calculateHash(hashString);
    return paymentHash;
  }

  static String beneficiaryDetail() {
    var ifscStr = ",\"ifscCode\":\"${PayUTestCredentials.accountIFSC}\"";
    var beneficiaryDetail = "{\"beneficiaryAccountNumber\":\"${PayUTestCredentials.accountNumber}\"$ifscStr}";
    return beneficiaryDetail;
  }

  static String paymentHashString(String txnId){
    var hashString = '${PayUTestCredentials.merchantKey}|$txnId|${PayUTestCredentials.amount}|${PayUTestCredentials.productInfo}|${PayUTestCredentials.firstName}|${PayUTestCredentials.email}|${PayUTestCredentials.udf1}|${PayUTestCredentials.udf2}|${PayUTestCredentials.udf3}|${PayUTestCredentials.udf4}|${PayUTestCredentials.udf5}|||||';
    return hashString;
  }

  static String calculateHash(String hashString) {
    print("flutter hash Stirng $hashString");
    var bytes = utf8.encode(hashString); // data being hashed
    var hash = sha512.convert(bytes);
    print("flutter hashData $hash");
    return hash.toString();
  }

}