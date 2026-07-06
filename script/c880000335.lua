-- AUTO-GENERATED: OP02-090 / 히드라
-- rules_id=OP02-090 script_id=880000335 fingerprint=d07bcbd52339d6e8b8bf9b7e5b7ade9331d9e7de7bdc9bd76dcfdc9617471f0d
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP02-090]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=-3000,
            duration=[[THIS_TURN]],
            op=[[MODIFY_POWER]],
            selector={
              count=1,
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
        },
        conditions={},
        costs={
          {
            count=1,
            op=[[RETURN_DON]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【메인】두웅!!-1(자신 필드의 두웅!!을 지정된 수만큼 두웅!! 덱으로 되돌릴 수 있다): 이번 턴 동안, 상대의 캐릭터 1장까지의 파워 -3000.]],
        timings={
          [[MAIN]],
        },
      },
      {
        actions={
          {
            count=1,
            mode=[[EXACT]],
            op=[[RETURN_DON]],
            player=[[OPPONENT]],
          },
        },
        conditions={
          {
            count=6,
            op=[[FIELD_DON_GTE]],
            player=[[OPPONENT]],
          },
        },
        costs={},
        effect_id=[[T1]],
        once_per_turn=false,
        source_text=[[상대 필드의 두웅!!이 6장 이상인 경우, 상대는 자신 필드의 두웅!! 1장을 두웅!! 덱으로 되돌린다.]],
        timings={
          [[LIFE_TRIGGER]],
        },
      },
    },
    keywords={},
    rules_id=[[OP02-090]],
    schema_version=1,
  })
end
