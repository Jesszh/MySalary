//
//  OliveCalculator.m
//  MySalary
//
//  Created by Jess on 13-5-14.
//  Copyright (c) 2013年 UDL. All rights reserved.
//

#import "OliveCalculator.h"
#import "OliveSalaryDetails.h"
#import "OliveFund.h"
#import "OliveSalaryDetails.h"
#import "OliveTaxRate.h"
#import "OliveAppDelegate.h"

@implementation OliveCalculator
- (id)init {
    if (self = [super init]) {
                
        return self;
    }
    
    return nil;
}

- (OliveSalaryDetails *) calWithPreTaxIncome:(double)income
                   threshold:(double)threshold
                         pmu:(double)pmu
                 housingFund:(double)housingFund
                        city:(OliveCity *)city{
    
        double upperPMU = city.rangePMU.upper;
        double lowerPMU = city.rangePMU.lower;
        double upperHousingFund = city.rangeBasicHousingFund.upper;
        double lowerHousingFund = city.rangeBasicHousingFund.lower;
        
        double preTaxIncome = income;
        
        double incomePMU = preTaxIncome;
        double incomeHouringFund = preTaxIncome;
        
        if (pmu == -1 || housingFund == -1) {
            if (preTaxIncome >= upperPMU) {
                incomePMU = upperPMU;
            } else if (preTaxIncome < lowerPMU){
                incomePMU = lowerPMU;
            }
            
            if (preTaxIncome >= upperHousingFund) {
                incomeHouringFund = upperHousingFund;
            } else if (preTaxIncome < lowerHousingFund){
                incomeHouringFund = lowerHousingFund;
            }
        } else {
            incomePMU = pmu;
            incomeHouringFund = housingFund;
        }
        
        
        OliveFund *fund = city.fund;
        
        double pensionAmount = incomePMU * fund.pension;
        double medicalCareAmount = incomePMU * fund.medicalCare;
        double unemploymentAmount = incomePMU * fund.unemployment;
        
        double cPensionAmount = incomePMU * fund.cPension;
        double cMedicalCareAmount = incomePMU * fund.cMedicalCare;
        double cUnemploymentAmount = incomePMU * fund.cUnemployment;
        double cIndustrialInjuryAmount = incomePMU * fund.cIndustrialInjury;
        double cPregnancyAmount = incomePMU * fund.cPregnancy;
        
        double basicHousingFundAmount = incomeHouringFund * fund.basicHousingFund;
        double totalPersonalAmount = pensionAmount + medicalCareAmount + unemploymentAmount + basicHousingFundAmount;
        double totalCompanyAmount = cPensionAmount + cMedicalCareAmount + cUnemploymentAmount + cIndustrialInjuryAmount + cPregnancyAmount + basicHousingFundAmount;
        
        double amountWithoutFund = preTaxIncome - pensionAmount - medicalCareAmount - unemploymentAmount - basicHousingFundAmount;
        
        if (amountWithoutFund < threshold) {
            
            OliveSalaryDetails *salaryDetails = [[OliveSalaryDetails alloc]initWithCity:city
                                                                           preTaxIncome:preTaxIncome
                                                                         afterTaxIncome:amountWithoutFund
                                                                          taxableAmount:0
                                                                                    tax:0
                                                                          pensionAmount:pensionAmount
                                                                      medicalCareAmount:medicalCareAmount
                                                                     unemploymentAmount:unemploymentAmount
                                                                         cPensionAmount:cPensionAmount
                                                                     cMedicalCareAmount:cMedicalCareAmount
                                                                    cUnemploymentAmount:cUnemploymentAmount
                                                                cIndustrialInjuryAmount:cIndustrialInjuryAmount
                                                                       cPregnancyAmount:cPregnancyAmount
                                                                 basicHousingFundAmount:basicHousingFundAmount
                                                                    totalPersonalAmount:totalPersonalAmount
                                                                     totalCompanyAmount:totalCompanyAmount];
            
            return salaryDetails;
        }
        
        double taxableAmount = amountWithoutFund - threshold;
        OliveTaxRate *taxRate = [OliveTaxRate initWithTaxableAmount:taxableAmount];
        
        double tax = taxableAmount * taxRate.taxRate - taxRate.deduction;
        
        double afterTaxIncome = amountWithoutFund - tax;
        
        OliveSalaryDetails *salaryDetails = [[OliveSalaryDetails alloc]initWithCity:city
                                                                       preTaxIncome:preTaxIncome
                                                                     afterTaxIncome:afterTaxIncome
                                                                      taxableAmount:taxableAmount
                                                                                tax:tax
                                                                      pensionAmount:pensionAmount
                                                                  medicalCareAmount:medicalCareAmount
                                                                 unemploymentAmount:unemploymentAmount
                                                                     cPensionAmount:cPensionAmount
                                                                 cMedicalCareAmount:cMedicalCareAmount
                                                                cUnemploymentAmount:cUnemploymentAmount
                                                            cIndustrialInjuryAmount:cIndustrialInjuryAmount
                                                                   cPregnancyAmount:cPregnancyAmount
                                                             basicHousingFundAmount:basicHousingFundAmount
                                                                totalPersonalAmount:totalPersonalAmount
                                                                 totalCompanyAmount:totalCompanyAmount];
        
        return salaryDetails;
        
    }


- (OliveSalaryDetails *)calWithAfterTaxIncome:(double)income
                                    threshold:(double)threshold
                                          pmu:(double)pmu
                                  housingFund:(double)housingFund
                                         city:(OliveCity *)city{
    
    double taxedAmount = income - threshold;
    OliveTaxRate *taxRate = [OliveTaxRate initWithTaxedAmount:taxedAmount];
    double amountWithoutFund = (income - threshold * taxRate.taxRate - taxRate.deduction) / (1-taxRate.taxRate);
    
    double tax = amountWithoutFund - income;
    
    double taxableAmount = amountWithoutFund - threshold;
    
    OliveFund *fund = city.fund;
    
    double preTaxIncome,
    incomePMU,
    incomeHouringFund,
    pensionAmount,
    medicalCareAmount,
    unemploymentAmount,
    cPensionAmount,
    cMedicalCareAmount,
    cUnemploymentAmount,
    cIndustrialInjuryAmount,
    cPregnancyAmount,basicHousingFundAmount;
    
    if (pmu == -1 || housingFund == -1) {
        
        double tryPreTaxIncome = amountWithoutFund/(1-fund.pension-fund.medicalCare-fund.unemployment-fund.basicHousingFund);
        
        if(tryPreTaxIncome > city.rangePMU.upper){
            incomePMU = city.rangePMU.upper;
        }else if(tryPreTaxIncome < city.rangePMU.lower){
            incomePMU = city.rangePMU.lower;
        }else{
            incomePMU = tryPreTaxIncome;}
        
        if(tryPreTaxIncome > city.rangeBasicHousingFund.upper){
            incomeHouringFund = city.rangeBasicHousingFund.upper;
        }else if(tryPreTaxIncome < city.rangeBasicHousingFund.lower){
            incomeHouringFund = city.rangeBasicHousingFund.lower;
        }else{
            incomeHouringFund = tryPreTaxIncome;}
        
        pensionAmount = incomePMU * fund.pension;
        medicalCareAmount = incomePMU * fund.medicalCare;
        unemploymentAmount = incomePMU * fund.unemployment;
        
        cPensionAmount = incomePMU * fund.cPension;
        cMedicalCareAmount = incomePMU * fund.cMedicalCare;
        cUnemploymentAmount = incomePMU * fund.cUnemployment;
        cIndustrialInjuryAmount = incomePMU * fund.cIndustrialInjury;
        cPregnancyAmount = incomePMU * fund.cPregnancy;
        
        basicHousingFundAmount = incomeHouringFund * fund.basicHousingFund;
        
    } else {
        
        incomePMU = pmu;
        incomeHouringFund = housingFund;
        
        pensionAmount = incomePMU * fund.pension;
        medicalCareAmount = incomePMU * fund.medicalCare;
        unemploymentAmount = incomePMU * fund.unemployment;
        
        cPensionAmount = incomePMU * fund.cPension;
        cMedicalCareAmount = incomePMU * fund.cMedicalCare;
        cUnemploymentAmount = incomePMU * fund.cUnemployment;
        cIndustrialInjuryAmount = incomePMU * fund.cIndustrialInjury;
        cPregnancyAmount = incomePMU * fund.cPregnancy;
        
        basicHousingFundAmount = incomeHouringFund * fund.basicHousingFund;
        
    }
    
    preTaxIncome = amountWithoutFund + pensionAmount + medicalCareAmount + unemploymentAmount + basicHousingFundAmount;
    
    double totalPersonalAmount = pensionAmount + medicalCareAmount + unemploymentAmount + basicHousingFundAmount;
    double totalCompanyAmount = cPensionAmount+cMedicalCareAmount+cUnemploymentAmount + cIndustrialInjuryAmount + cPensionAmount;
    
    
    OliveSalaryDetails *salaryDetails = [[OliveSalaryDetails alloc]initWithCity:city
                                                                   preTaxIncome:preTaxIncome
                                                                 afterTaxIncome:income
                                                                  taxableAmount:taxableAmount
                                                                            tax:tax
                                                                  pensionAmount:pensionAmount
                                                              medicalCareAmount:medicalCareAmount
                                                             unemploymentAmount:unemploymentAmount
                                                                 cPensionAmount:cPensionAmount
                                                             cMedicalCareAmount:cMedicalCareAmount
                                                            cUnemploymentAmount:cUnemploymentAmount
                                                        cIndustrialInjuryAmount:cIndustrialInjuryAmount
                                                               cPregnancyAmount:cPregnancyAmount
                                                         basicHousingFundAmount:basicHousingFundAmount
                                                            totalPersonalAmount:totalPersonalAmount
                                                             totalCompanyAmount:totalCompanyAmount];
    return salaryDetails;
}
@end
