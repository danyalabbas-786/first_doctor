import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

void main() => runApp(AntibioticApp());

class User {
  String name;
  String email;
  User({required this.name, required this.email});
}

/* Global logged-in user */
User? loggedInUser;

class AntibioticApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Antibiotic Awareness',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        fontFamily: 'Roboto',
      ),
      home: LoginScreen(),
    );
  }
}

/* ================= LOGIN ================= */
class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.teal.shade200, Colors.blue.shade100],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(24),
              child: Column(
                children: [
                  Image.asset('assets/logo.png', height: 120),
                  SizedBox(height: 30),
                  Text('Welcome Back',
                      style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                  SizedBox(height: 20),
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                        hintText: 'Email',
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12))),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal,
                        minimumSize: Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12))),
                    child: Text('Login', style: TextStyle(fontSize: 18)),
                    onPressed: () {
                      loggedInUser =
                          User(name: "Demo User", email: emailController.text);
                      Navigator.pushReplacement(
                          context, MaterialPageRoute(builder: (_) => HomeScreen()));
                    },
                  ),
                  SizedBox(height: 12),
                  TextButton(
                      child: Text('Don\'t have an account? Signup',
                          style: TextStyle(color: Colors.white)),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => SignupScreen()));
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/* ================= SIGNUP ================= */
class SignupScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.orange.shade200, Colors.red.shade100],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight)),
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(24),
              child: Column(
                children: [
                  Image.asset('assets/logo.png', height: 120),
                  SizedBox(height: 30),
                  Text('Create Account',
                      style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                  SizedBox(height: 20),
                  TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                        hintText: 'Name',
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12))),
                  ),
                  SizedBox(height: 16),
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                        hintText: 'Email',
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12))),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.redAccent,
                          minimumSize: Size(double.infinity, 50),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12))),
                      child: Text('Signup', style: TextStyle(fontSize: 18)),
                      onPressed: () {
                        loggedInUser = User(
                            name: nameController.text,
                            email: emailController.text);
                        Navigator.pushReplacement(
                            context, MaterialPageRoute(builder: (_) => HomeScreen()));
                      }),
                  SizedBox(height: 12),
                  Text('You will be logged in after signup',
                      style: TextStyle(color: Colors.white70)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/* ================= HOME ================= */
class HomeScreen extends StatelessWidget {
  final List<_HomeCardItem> cards = [
    _HomeCardItem('Symptoms & Risk', Icons.healing, Colors.teal, SymptomScreen()),
    _HomeCardItem('Awareness', Icons.info, Colors.orange, AwarenessScreen()),
    _HomeCardItem('Profile', Icons.person, Colors.purple, ProfileScreen()),
    _HomeCardItem('Graphs', Icons.bar_chart, Colors.blue, GraphScreen()),
    _HomeCardItem('Doctor Advice / Courses', Icons.school, Colors.green, CourseScreen()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.teal.shade100, Colors.blue.shade50],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
        ),
        child: Column(
          children: [
            SizedBox(height: 50),
            Text('Antibiotic Awareness App',
                style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal.shade900)),
            SizedBox(height: 20),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                padding: EdgeInsets.all(16),
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: cards
                    .map((c) => InkWell(
                          onTap: () =>
                              Navigator.push(context, MaterialPageRoute(builder: (_) => c.screen)),
                          child: Container(
                            decoration: BoxDecoration(
                              color: c.color,
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 6,
                                    offset: Offset(2, 2))
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(c.icon, size: 50, color: Colors.white),
                                SizedBox(height: 12),
                                Text(c.title,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                        ))
                    .toList(),
              ),
            ),
            Image.asset('assets/logo.png', height: 80),
            SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}

class _HomeCardItem {
  final String title;
  final IconData icon;
  final Color color;
  final Widget screen;
  _HomeCardItem(this.title, this.icon, this.color, this.screen);
}

/* ================= PROFILE ================= */
class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile'), backgroundColor: Colors.purple),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            CircleAvatar(radius: 50, child: Icon(Icons.person, size: 50)),
            SizedBox(height: 10),
            Text('${loggedInUser?.name ?? "User"}',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text('Email: ${loggedInUser?.email ?? "user@example.com"}'),
            SizedBox(height: 20),
            Text('App: Antibiotic Awareness & Risk Assessment',
                textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}

/* ================== DOCTOR / COURSES ================= */
class CourseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: Text('Doctor Advice / Courses'), backgroundColor: Colors.green),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          ListTile(
            leading: Icon(Icons.medical_services, color: Colors.green),
            title: Text('How to use antibiotics correctly'),
            subtitle: Text('Follow prescription, complete full course'),
          ),
          ListTile(
            leading: Icon(Icons.medical_services, color: Colors.green),
            title: Text('Preventing resistance'),
            subtitle: Text('Do not self-medicate or share antibiotics'),
          ),
        ],
      ),
    );
  }
}

/* ================= AWARENESS SCREEN ================= */
class AwarenessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: Text('Awareness & Antibiotics'), backgroundColor: Colors.orange),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Card(
            color: Colors.redAccent.withOpacity(0.8),
            margin: EdgeInsets.only(bottom: 12),
            child: ListTile(
              leading: Icon(Icons.warning, color: Colors.white),
              title: Text('❌ Self-Medication',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              subtitle: Text('Never use antibiotics without prescription.',
                  style: TextStyle(color: Colors.white70)),
            ),
          ),
          Card(
            color: Colors.orange.withOpacity(0.8),
            margin: EdgeInsets.only(bottom: 12),
            child: ListTile(
              leading: Icon(Icons.warning, color: Colors.white),
              title: Text('🦠 Viral ≠ Antibiotics',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              subtitle: Text('Antibiotics do not treat viral infections.',
                  style: TextStyle(color: Colors.white70)),
            ),
          ),
        ],
      ),
    );
  }
}

/* ================= GRAPH SCREEN ================= */
class GraphScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Risk Graph'), backgroundColor: Colors.blue),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: BarChart(
          BarChartData(
            barGroups: [
              BarChartGroupData(x: 0, barRods: [BarChartRodData(toY: 2, color: Colors.green)]),
              BarChartGroupData(x: 1, barRods: [BarChartRodData(toY: 4, color: Colors.orange)]),
              BarChartGroupData(x: 2, barRods: [BarChartRodData(toY: 6, color: Colors.red)]),
            ],
            titlesData: FlTitlesData(
              leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: true)),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: (v, meta) {
                    return Padding(
                      padding: EdgeInsets.only(top: 8),
                      child: Text(['Low', 'Medium', 'High'][v.toInt()]),
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/* ================= SYMPTOM SCREEN ================= */
class SymptomScreen extends StatefulWidget {
  @override
  _SymptomScreenState createState() => _SymptomScreenState();
}

class _SymptomScreenState extends State<SymptomScreen> {
  List<String> selected = [];
  final symptoms = ['Fever','Cough','Cold','Diarrhea','UTI','Wound','Sore Throat','Tooth Pain'];

  String riskLevel() {
    if(selected.contains('UTI') || selected.length>=3) return 'High';
    if(selected.length==2) return 'Medium';
    return 'Low';
  }

  Map<String,String> firstAid(String s){
    switch(s){
      case 'Fever': return {'type':'Usually Viral','aid':'Rest, fluids, paracetamol','antibiotic':'Do NOT use antibiotics without prescription','doctor':'See doctor if >3 days'};
      case 'Cough': return {'type':'Viral Infection','aid':'Steam, fluids','antibiotic':'Not required','doctor':'See doctor if persistent'};
      case 'Cold': return {'type':'Viral','aid':'Rest, fluids','antibiotic':'Not required','doctor':'If lasts >5 days'};
      case 'Diarrhea': return {'type':'Food/Viral','aid':'ORS, light food','antibiotic':'Not usually required','doctor':'If blood or dehydration'};
      case 'UTI': return {'type':'Bacterial','aid':'Drink water','antibiotic':'Doctor prescribed only','doctor':'See doctor'};
      case 'Wound': return {'type':'Local Injury','aid':'Clean & antiseptic','antibiotic':'Topical care first','doctor':'If deep/infected'};
      case 'Sore Throat': return {'type':'Viral','aid':'Warm salt gargle','antibiotic':'Only if bacterial','doctor':'See doctor if severe'};
      case 'Tooth Pain': return {'type':'Dental','aid':'Pain relief, rinse','antibiotic':'Only if infection','doctor':'See dentist'};
      default: return {'type':'Unknown','aid':'Basic care','antibiotic':'Consult doctor','doctor':'Consult doctor'};
    }
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text('Symptoms & Risk'), backgroundColor: Colors.teal),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children:[
            Text('Select your symptoms:', style: TextStyle(fontSize:18,fontWeight: FontWeight.bold)),
            Expanded(
              child: ListView(
                children: symptoms.map((s)=>CheckboxListTile(
                  title: Text(s),
                  value: selected.contains(s),
                  onChanged:(v)=>setState(()=>v!?selected.add(s):selected.remove(s)),
                )).toList(),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                minimumSize: Size(double.infinity,50),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: Text('Assess Risk & Guidance'),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (_)=>RiskScreen(selectedSymptoms:selected,risk:riskLevel(),firstAidMap:firstAid)));
              },
            )
          ]
        ),
      ),
    );
  }
}

/* ================= RISK SCREEN ================= */
class RiskScreen extends StatelessWidget{
  final List<String> selectedSymptoms;
  final String risk;
  final Map<String,String> Function(String) firstAidMap;
  RiskScreen({required this.selectedSymptoms,required this.risk,required this.firstAidMap});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text('Risk & Guidance'), backgroundColor: Colors.teal),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: ListView(
          children:[
            Text('Risk Level: $risk',style: TextStyle(fontSize:22,fontWeight: FontWeight.bold)),
            SizedBox(height:10),
            ...selectedSymptoms.map((s){
              final info=firstAidMap(s);
              return Card(
                color: Colors.teal.shade50,
                margin: EdgeInsets.only(bottom:12),
                child: Padding(
                  padding: EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:[
                      Text('Symptom: $s',style: TextStyle(fontWeight: FontWeight.bold,fontSize:16)),
                      Text('Type: ${info['type']}'),
                      Text('First Aid: ${info['aid']}'),
                      Text('Antibiotic Advice: ${info['antibiotic']}'),
                      Text('Doctor: ${info['doctor']}'),
                    ],
                  ),
                ),
              );
            }).toList()
          ],
        ),
      ),
    );
  }
}
