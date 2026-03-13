import '../models/disease.dart';

final List<Disease> pathologies = [

  Disease(
    id: "hypertension",
    name: "Hypertension",
    category: "Cardiovascular",
    shortDescription:
    "Persistent high blood pressure that can lead to heart disease and stroke.",
    symptoms: ["Headaches", "Dizziness", "Blurred vision"],
    causes: ["Kidney disease", "Obesity"],
    diagnosis: ["Blood pressure test", "ECG"],
    treatment: ["Lifestyle changes", "ACE inhibitors"],
    prevention: ["Exercise", "Healthy diet"],
    riskFactors: ["Age", "Family history"],
    isPopular: true,
  ),

  Disease(
    id: "diabetes-type2",
    name: "Type 2 Diabetes",
    category: "Endocrine",
    shortDescription:
    "A chronic condition affecting blood sugar regulation.",
    symptoms: ["Increased thirst", "Frequent urination"],
    causes: ["Obesity", "Insulin resistance"],
    diagnosis: ["A1C test", "Fasting glucose"],
    treatment: ["Metformin", "Diet control"],
    prevention: ["Healthy lifestyle"],
    riskFactors: ["Age", "Obesity"],
    isPopular: true,
  ),

  Disease(
    id: "anemia",
    name: "Anemia",
    category: "Blood",
    shortDescription:
    "A condition in which the body lacks enough healthy red blood cells.",
    symptoms: ["Fatigue", "Weakness", "Pale skin"],
    causes: ["Iron deficiency", "Vitamin B12 deficiency"],
    diagnosis: ["CBC test", "Hemoglobin test"],
    treatment: ["Iron supplements", "Diet changes"],
    prevention: ["Iron-rich diet"],
    riskFactors: ["Poor nutrition", "Pregnancy"],
    isPopular: true,
  ),

  Disease(
    id: "influenza",
    name: "Influenza (Flu)",
    category: "Infectious",
    shortDescription:
    "A contagious respiratory illness caused by influenza virus.",
    symptoms: ["Fever", "Cough", "Body aches"],
    causes: ["Influenza virus"],
    diagnosis: ["Rapid flu test", "PCR test"],
    treatment: ["Antiviral medication", "Rest"],
    prevention: ["Flu vaccine", "Hand hygiene"],
    riskFactors: ["Weak immunity", "Elderly"],
    isPopular: false,
  ),
];
