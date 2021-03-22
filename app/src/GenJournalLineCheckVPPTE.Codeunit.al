/// <summary>
/// Codeunit Gen. Journal Line-Check VPPTE (ID 81601).
/// Sets the RaiseError to False, to allow for payments being reversed to be posted with the Document Type of Payment, so that the 'Payments' on the Customer and Vendor will add up
/// </summary>
codeunit 81601 "Gen. Journal Line-Check VPPTE"
{
    Access = Internal;

    procedure DoNotRaiseErrorForFinancialVoidVendorPayments(GenJnlLine: Record "Gen. Journal Line"; var RaiseError: Boolean);
    begin
        if not GenJnlLine."Financial Void" then
            exit;

        if GenJnlLine."Document Type" <> GenJnlLine."Document Type"::Payment then
            exit;

        RaiseError := false;
    end;

    procedure DoNotRaiseErrorForFinancialVoidCustomerPayments(GenJnlLine: Record "Gen. Journal Line"; var RaiseError: Boolean);
    begin
        if not GenJnlLine."Financial Void" then
            exit;

        if GenJnlLine."Document Type" <> GenJnlLine."Document Type"::Refund then
            exit;

        RaiseError := false;
    end;
}