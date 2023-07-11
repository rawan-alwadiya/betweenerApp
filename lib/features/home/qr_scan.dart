import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qrscan/qrscan.dart' as scanner;
class ScanCode extends StatelessWidget {
  static String id = '/scan_code';
  const ScanCode({super.key});

  Future _qrScanner() async {
    var cameraStatus = await Permission.camera.status;
    if (cameraStatus.isGranted) {
      String? qrData = await scanner.scan();
      // String? qrPhonePhoto = await scanner.scanPhoto();
    }else{
      var isGrant= await Permission.camera.request();
      if(isGrant.isGranted){
        String? qrData = await scanner.scan();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_outlined,
            color: Colors.white,
            size: 24,
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only( top: 60, bottom: 70),
            child: Text('Scan your QR code',style: GoogleFonts.roboto(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Colors.white
            ),),
          ),
          InkWell(
            onTap: ()=>_qrScanner(),
            child: Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    'assets/imgs/qr_scanner.png',
                    width: 317.72,
                    height: 351.58,
                    fit: BoxFit.fill,
                  ),
                  Positioned(
                    top: 35,
                    child: Container(
                      width: 240,
                      height: 2.5,
                      color: Color(0xFF2AD23B),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}