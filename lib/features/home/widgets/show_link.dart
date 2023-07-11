import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ShowLink extends StatelessWidget {
  final String title;
  final String account;
  const ShowLink({
    super.key,
    required this.title,
    required this.account
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        width: 146,
        height: 90,
        margin: EdgeInsets.only(left: 22),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Color(0xFFFFE6A6),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            children: [
              Text(title, style: GoogleFonts.roboto(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  letterSpacing: 0.1,
                  color: Color(0xFF784E00)
              ),),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(account, style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w300,
                    fontSize: 14,
                    letterSpacing: 0.1,
                    color: Color(0xFF784E00)
                ),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}