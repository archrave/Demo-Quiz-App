import 'package:http/http.dart' as http;
import 'dart:convert';

class GetData {
  List<Map<String, dynamic>> newQues;

  Future<void> fetchQuestions() async {
    var url =
        Uri.parse('http://perceptiondraft.com//api//gbas00721-quiz.php?cid=1');
    try {
      final response = await http.get(url);
      final extractedData = (json.decode(response.body));
      List<Map<String, dynamic>> newQuestions = [];
      extractedData.forEach((element) {
        newQuestions.add({
          'questionText1': element['q'].split(new RegExp(r"[:]"))[0],
          'questionText2': element['q'].split(new RegExp(r"[:]"))[1],
          'answers': [
            element['o1'],
            element['o1'],
            element['o1'],
            element['o1']
          ],
          'correctAns': element['co'],
        });
      });
      newQues = newQuestions;
      print(newQues);
      print(newQues.runtimeType);
    } catch (error) {
      throw (error);
    }
  }
}
