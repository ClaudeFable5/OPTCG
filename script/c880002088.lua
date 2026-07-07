-- AUTO-GENERATED: ST18-002 / 오나미
-- rules_id=ST18-002 script_id=880002088 fingerprint=4356e98f93e93cf0ddd23c2e2f87e23eca753dbcc926b7db387a6834534d2997
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST18-002]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            op=[[TRASH_HAND]],
            player=[[YOU]],
          },
          {
            count=2,
            op=[[DRAW]],
            player=[[YOU]],
            ["then"]=true,
          },
        },
        conditions={
          {
            count=8,
            op=[[FIELD_DON_GTE]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【등장 시】자신 필드의 두웅!!이 8장 이상인 경우, 자신의 패 1장을 버리고 카드를 2장 뽑는다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[ST18-002]],
    schema_version=1,
  })
end
