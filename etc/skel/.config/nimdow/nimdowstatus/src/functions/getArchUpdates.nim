var
  uTimeStamp: Option[DateTime]
  sUpdates: string = ""

proc getArchUpdates(): string =
  if uTimeStamp.isSome and uTimeStamp.get() + initDuration(
      minutes = UPDATE_UPDATES) > now():
    result = UPDATE_ICON & sUpdates
  else:
    uTimeStamp = some(now())
    try:
      sUpdates = execProcess("checkupdates | wc -l")
      discard parseInt(sUpdates)
      result = UPDATE_ICON & sUpdates
    except CatchableError as e:
      result = UPDATE_ICON & " N/A"
    finally:
      discard





