-- Hair by Lynna — 026: overnight grace period for short-notice deposits.
-- Requests submitted between 00:00 inclusive and 07:00 exclusive (Montréal
-- local time) for appointments starting within 48 hours receive a 09:00
-- Montréal-local deposit deadline on the morning of submission.
-- All other requests keep their existing 2-hour or 24-hour deposit deadline.
-- Only NEW appointments are affected; historical deadlines remain fixed.
-- Existing alerts follow appointments.deposit_due_at automatically.
begin;

create or replace function public.set_initial_deposit_deadline()
returns trigger
language plpgsql
set search_path = ''
as $$
declare
  local_submission timestamp without time zone;
begin
  -- Preserve any deadline already explicitly supplied.
  if new.deposit_due_at is not null then
    return new;
  end if;

  if new.starts_at <= new.created_at + interval '48 hours' then
    local_submission := new.created_at at time zone 'America/Toronto';
    if local_submission::time >= time '00:00'
       and local_submission::time < time '07:00' then
      -- Compute 09:00 in local wall time, then convert to timestamptz.
      -- This also handles Montréal daylight saving time correctly.
      new.deposit_due_at :=
        (local_submission::date + time '09:00') at time zone 'America/Toronto';
    else
      new.deposit_due_at := new.created_at + interval '2 hours';
    end if;
  else
    new.deposit_due_at := new.created_at + interval '24 hours';
  end if;

  return new;
end $$;

commit;
