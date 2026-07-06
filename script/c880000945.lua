-- AUTO-GENERATED: OP07-090 / 모르건즈
-- rules_id=OP07-090 script_id=880000945 fingerprint=a7c3d628a9e7c343be3b663ff2fc372c269fc1e2eab4837178b53da08b7401ae
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP07-090]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            op=[[TRASH_HAND]],
            player=[[OPPONENT]],
          },
          {
            count=0,
            mode=[[ALL]],
            op=[[REVEAL_HAND]],
            player=[[OPPONENT]],
          },
          {
            count=1,
            op=[[DRAW]],
            player=[[OPPONENT]],
            ["then"]=true,
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】상대는 자신의 패 1장을 버리고, 패를 공개한다. 그 후, 상대는 카드를 1장 뽑는다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP07-090]],
    schema_version=1,
  })
end
