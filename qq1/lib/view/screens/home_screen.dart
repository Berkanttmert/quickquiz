import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../controller/index_controller.dart';
import '../../utilities/list_of_answers.dart';
import '../../utilities/list_of_questions.dart';
import '../Widgets/choose_an_answer_box.dart';
import '../Widgets/option_box.dart';
import '../Widgets/question_answer_divider.dart';
import '../Widgets/question_box.dart';
import '../Widgets/question_mark_icon.dart';
import '../Widgets/question_number_index.dart';
import 'result_screen.dart';

class FirstPage extends StatelessWidget {
  int indexForQuestionNumber = 1;
  int selectedOption = 0;
  int marksObtainedFromCorrectAnswer = 0;

  FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final shouldPop = await showDialog<bool>(
          context: context,
          builder: (context) {
            return AlertDialog(
              insetPadding: EdgeInsets.zero,
              contentTextStyle: GoogleFonts.mulish(),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              title: const Text('Quit Quiz?'),
              content: const Text(
                'Are you sure you want exit!',
                textAlign: TextAlign.left,
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => exit(0)));
                  },
                  child: const Text(
                    'Yes',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context, false);
                  },
                  child: const Text('No'),
                ),
              ],
            );
          },
        );
        return shouldPop!;
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          toolbarHeight: 78,
          backgroundColor: Colors.black,
          title: Text(
            'Quick Quiz',
            style: GoogleFonts.mulish(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 25,
              letterSpacing: -0.3,
            ),
          ),
          centerTitle: true,
          elevation: 0,
          foregroundColor: Colors.white,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

          //Main Column
          children: [
            Consumer<IndexController>(builder: (context, provider, child) {
              indexForQuestionNumber = provider.currentQuestionIndex;
              selectedOption = provider.optionSelected;
              return QuestionNumberIndex(
                questionNumber: indexForQuestionNumber,
              );
            }),
            Consumer<IndexController>(builder: (context, provider, child) {
              indexForQuestionNumber = provider.currentQuestionIndex;

              return QuestionBox(
                  question: questionsList[indexForQuestionNumber]);
            }),
            const ChooseAnAnswerBox(),
            Consumer<IndexController>(builder: (context, provider, child) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OptionBox(
                    optionSelected: provider.optionSelected,
                    optionParameter: optionOne,
                    optionIndex: 'A.',
                    indexForQuestionNumber: provider.currentQuestionIndex,
                    providerIndexForOption: 1,
                  ),
                  OptionBox(
                    optionSelected: provider.optionSelected,
                    optionParameter: optionTwo,
                    optionIndex: 'B.',
                    indexForQuestionNumber: provider.currentQuestionIndex,
                    providerIndexForOption: 2,
                  ),
                  OptionBox(
                    optionSelected: provider.optionSelected,
                    optionParameter: optionThree,
                    optionIndex: 'C.',
                    indexForQuestionNumber: provider.currentQuestionIndex,
                    providerIndexForOption: 3,
                  ),
                  OptionBox(
                    optionSelected: provider.optionSelected,
                    optionParameter: optionFour,
                    optionIndex: 'D.',
                    indexForQuestionNumber: provider.currentQuestionIndex,
                    providerIndexForOption: 4,
                  ),
                  Consumer<IndexController>(
                      builder: (context, provider, child) {
                    indexForQuestionNumber = provider.currentQuestionIndex;
                    selectedOption = provider.optionSelected;

                    return selectedOption > 0
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Container(
                                      height: 45,
                                      width: 100,
                                      decoration: BoxDecoration(
                                        color: Colors.orange,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: ListTile(
                                        onTap: () {
                                          marksForCorrectAnswers();
                                          if (indexForQuestionNumber < 10) {
                                            provider.updateIndexForQuestion();
                                          } else {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      ResultPage(
                                                    marksEarnedFromQuiz:
                                                        marksObtainedFromCorrectAnswer,
                                                  ),
                                                ));
                                          }
                                          provider.selectedOptionIndex(0);
                                        },
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        leading: Text(
                                          'NEXT',
                                          style: GoogleFonts.mulish(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                        : const SizedBox(
                            height: 65,
                          );
                  })
                ],
              );
            }),
          ],
        ),
      ),
    );
  }

  void marksForCorrectAnswers() {
    if (indexForQuestionNumber == 1) {
      if (selectedOption == 1) {
        marksObtainedFromCorrectAnswer++;
      }
    }
    if (indexForQuestionNumber == 2) {
      if (selectedOption == 3) {
        marksObtainedFromCorrectAnswer++;
      }
    }
    if (indexForQuestionNumber == 3) {
      if (selectedOption == 2) {
        marksObtainedFromCorrectAnswer++;
      }
    }
    if (indexForQuestionNumber == 4) {
      if (selectedOption == 2) {
        marksObtainedFromCorrectAnswer++;
      }
    }
    if (indexForQuestionNumber == 5) {
      if (selectedOption == 1) {
        marksObtainedFromCorrectAnswer++;
      }
    }
    if (indexForQuestionNumber == 6) {
      if (selectedOption == 4) {
        marksObtainedFromCorrectAnswer++;
      }
    }
    if (indexForQuestionNumber == 7) {
      if (selectedOption == 1) {
        marksObtainedFromCorrectAnswer++;
      }
    }
    if (indexForQuestionNumber == 8) {
      if (selectedOption == 3) {
        marksObtainedFromCorrectAnswer++;
      }
    }
    if (indexForQuestionNumber == 9) {
      if (selectedOption == 3) {
        marksObtainedFromCorrectAnswer++;
      }
    }
    if (indexForQuestionNumber == 10) {
      if (selectedOption == 4) {
        marksObtainedFromCorrectAnswer++;
      }
    }
  }
}
