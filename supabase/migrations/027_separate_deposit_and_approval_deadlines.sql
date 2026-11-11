-- Hair by Lynna — 027: restore the strict two-hour deposit deadline.
-- The overnight window is for Lynna's MANUAL APPROVAL RESPONSE, not payment.
-- Bookings within 48 hours: deposit due two hours after submission.
-- Bookings more than 48 hours away: deposit due 24 hours after submission.
-- Only future INSERTs are affected; no past booking rows are rewritten.
-- The booking email/Telegram notice (telegram-booking) tells customers Lynna
-- will respond by 9 a.m. Montréal time if:
--   1) their submission is from midnight through 6:59 a.m., OR
--   2) for a short-notice booking, its two-hour deposit deadline falls
--      from midnight through 6:59 a.m. (e.g. 11 p.m. -> 1 a.m.).
-- No automatic booking approval, cancellation, or deposit verification.

create or replace function public.set_initial_deposit_deadline()
returns trigger
language plpgsql
set search_path=''
as $$
begin
  if new.deposit_due_at is null then
    new.deposit_due_at := new.created_at + case
      when new.starts_at <= new.created_at + interval '48 hours'
      then interval '2 hours'
      else interval '24 hours'
    end;
  end if;
  return new;
end $$;
