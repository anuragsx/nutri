class Profile < ApplicationRecord
	#belongs_to :user

	FOOD_PREFERENCE 	= ['Vegan', 'Vegetarian', 'Non-Vegetarian', 'Eggetarian(Ovotarian)']
	MEDICAL_CONDITIONS = ['Diabetes', 'Blood Pressure', 'Acidity', 'Constipation',
											'Asthama', 'High Cholestrol/ Heart Condition', ' Thyroid Disorder',
										  'Gas/ Acidity', 'Migraine/ Headaches', 'Arthiritis/ Joint-Pain',
											'Fatigue/ Tiredness', 'Diarrhea', ' Uric Acid']
	SMOKING 					= ['Smoking', 'I never smoked', 'I have quit smoking', 'I smoke occasionally',
											'I somke regularly']
	DRINKING 					= ['Drinking', 'I never drinked', 'I have quit drinking', 'I drink occasionally',
											'I drink regularly']										
end	