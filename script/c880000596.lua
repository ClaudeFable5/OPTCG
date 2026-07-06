-- AUTO-GENERATED: OP04-104 / 상디
-- rules_id=OP04-104 script_id=880000596 fingerprint=0f7acc6ca2a8cebe0e5b5f4fe080d6fcc02cfc24c419f06ad61add616c0a70b1
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP04-104]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[PLAY_SELF]],
            rested=false,
          },
        },
        conditions={},
        costs={
          {
            count=1,
            op=[[TRASH_HAND]],
          },
        },
        effect_id=[[T1]],
        once_per_turn=false,
        source_text=[[자신의 패 1장을 버릴 수 있다: 이 카드를 등장시킨다.]],
        timings={
          [[LIFE_TRIGGER]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[OP04-104]],
    schema_version=1,
  })
end
