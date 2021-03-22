/// <summary>
/// Codeunit Gen Jnl Line-Check Event VPPTE (ID 81600).
/// Event Subscriber for the Void Payment Bug Fix Codeunit.
/// </summary>
codeunit 81600 "Gen Jnl Line-Check Event VPPTE"
{
    SingleInstance = true;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Gen. Jnl.-Check Line", 'OnBeforeErrorIfNegativeAmt', '', true, true)]
    local procedure OnBeforeErrorIfNegativeAmt(GenJnlLine: Record "Gen. Journal Line"; var RaiseError: Boolean);
    var
        GenJournalLineCheckVPPTE: Codeunit "Gen. Journal Line-Check VPPTE";
    begin
        GenJournalLineCheckVPPTE.DoNotRaiseErrorForFinancialVoidVendorPayments(GenJnlLine, RaiseError);
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Gen. Jnl.-Check Line", 'OnBeforeErrorIfPositiveAmt', '', true, true)]
    local procedure OnBeforeErrorIfPositiveAmt(GenJnlLine: Record "Gen. Journal Line"; var RaiseError: Boolean);
    var
        GenJournalLineCheckVPPTE: Codeunit "Gen. Journal Line-Check VPPTE";
    begin
        GenJournalLineCheckVPPTE.DoNotRaiseErrorForFinancialVoidCustomerPayments(GenJnlLine, RaiseError);
    end;
}



