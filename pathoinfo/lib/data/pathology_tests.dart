import '../models/pathology.dart';

final List<PathologyTest> pathologyTests = [

  PathologyTest(
    id: "cbc",
    name: "Complete Blood Count (CBC)",
    category: "Blood Test",
    shortDescription:
    "A common blood test used to evaluate overall health and detect a variety of disorders.",
    helpsDetect: [
      "Anemia",
      "Infections",
      "Leukemia"
    ],
    howItHelps: [
      "Measures red blood cells (RBC)",
      "Checks white blood cells (WBC)",
      "Evaluates hemoglobin levels"
    ],
    recommendedWhen: [
      "Fatigue",
      "Fever",
      "Routine health checkup"
    ],
    resultMeaning: [
      "Low RBC may indicate anemia",
      "High WBC may indicate infection",
      "Low hemoglobin indicates blood deficiency"
    ],
    normalRange: "WBC: 4,000–11,000 cells/mcL",
    isPopular: true,
  ),

  PathologyTest(
    id: "fasting-glucose",
    name: "Fasting Blood Sugar (FBS)",
    category: "Diabetes Test",
    shortDescription:
    "Measures blood glucose levels after fasting for at least 8 hours.",
    helpsDetect: [
      "Type 2 Diabetes",
      "Prediabetes"
    ],
    howItHelps: [
      "Determines blood sugar levels",
      "Helps monitor diabetes management"
    ],
    recommendedWhen: [
      "Increased thirst",
      "Frequent urination",
      "Family history of diabetes"
    ],
    resultMeaning: [
      "70–99 mg/dL = Normal",
      "100–125 mg/dL = Prediabetes",
      "126+ mg/dL = Diabetes"
    ],
    normalRange: "70–99 mg/dL",
    isPopular: true,
  ),

  PathologyTest(
    id: "lipid-profile",
    name: "Lipid Profile Test",
    category: "Cardiac Test",
    shortDescription:
    "Measures cholesterol and triglycerides to assess heart disease risk.",
    helpsDetect: [
      "Hypertension",
      "Heart Disease",
      "High Cholesterol"
    ],
    howItHelps: [
      "Checks LDL (bad cholesterol)",
      "Checks HDL (good cholesterol)",
      "Measures triglycerides"
    ],
    recommendedWhen: [
      "High blood pressure",
      "Obesity",
      "Routine cardiac screening"
    ],
    resultMeaning: [
      "High LDL increases heart risk",
      "Low HDL increases heart risk"
    ],
    normalRange: "Total Cholesterol: < 200 mg/dL",
    isPopular: true,
  ),

  PathologyTest(
    id: "thyroid-function",
    name: "Thyroid Function Test (TFT)",
    category: "Hormone Test",
    shortDescription:
    "Evaluates thyroid hormone levels to detect thyroid disorders.",
    helpsDetect: [
      "Hypothyroidism",
      "Hyperthyroidism"
    ],
    howItHelps: [
      "Measures T3, T4 levels",
      "Checks TSH levels"
    ],
    recommendedWhen: [
      "Weight changes",
      "Hair loss",
      "Fatigue"
    ],
    resultMeaning: [
      "High TSH may indicate hypothyroidism",
      "Low TSH may indicate hyperthyroidism"
    ],
    normalRange: "TSH: 0.4–4.0 mIU/L",
    isPopular: false,
  ),

];
