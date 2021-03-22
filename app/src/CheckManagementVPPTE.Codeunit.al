/// <summary>
/// Codeunit Check Management VPPTE (ID 81602).
/// Sets the "Document Type" to Payment 
/// </summary>
codeunit 81602 "Check Management VPPTE"
{
    Access = Internal;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::CheckManagement, 'OnFinancialVoidCheckOnBeforePostVend', '', true, true)]
    local procedure OnFinancialVoidCheckOnBeforePostVend(var GenJournalLine: Record "Gen. Journal Line");
    begin
        SetVendorVoidDocumentTypeToPayment(GenJournalLine);
    end;

    local procedure SetVendorVoidDocumentTypeToPayment(var GenJournalLine: Record "Gen. Journal Line");
    begin
        if GenJournalLine."Document Type" <> GenJournalLine."Document Type"::" " then
            exit;

        GenJournalLine."Document Type" := GenJournalLine."Document Type"::Payment;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::CheckManagement, 'OnFinancialVoidCheckOnBeforePostCust', '', true, true)]
    local procedure OnFinancialVoidCheckOnBeforePostCust(var GenJournalLine: Record "Gen. Journal Line");
    begin
        SetCustomerVoidDocumentTypeToRefund(GenJournalLine);
    end;

    local procedure SetCustomerVoidDocumentTypeToRefund(var GenJournalLine: Record "Gen. Journal Line");
    begin
        if GenJournalLine."Document Type" <> GenJournalLine."Document Type"::" " then
            exit;

        GenJournalLine."Document Type" := GenJournalLine."Document Type"::Refund;
    end;
}
