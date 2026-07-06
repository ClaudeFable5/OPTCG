-- AUTO-GENERATED: ST22-001 / 에이스 & 뉴게이트
-- rules_id=ST22-001 script_id=880001958 fingerprint=d41fe42aca935e166187e335b9c5edf40c0e0e749573d30a38fed38e974fb2b5
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST22-001]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            op=[[DRAW]],
            player=[[YOU]],
          },
          {
            count=1,
            op=[[RETURN_HAND_TO_DECK]],
            player=[[YOU]],
            positions={
              [[DECK_TOP]],
            },
            revealed=true,
            ["then"]=true,
          },
        },
        conditions={},
        costs={
          {
            count=1,
            filter={
              trait_contains=[[흰 수염 해적단]],
            },
            op=[[REVEAL_HAND]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=true,
        source_text=[[【기동: 메인】【턴 1회】자신의 패에서 『흰 수염 해적단』을 포함한 특징을 가진 카드 1장을 공개할 수 있다: 카드 1장을 뽑고, 공개한 카드를 덱의 맨 위로 되돌린다.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[ST22-001]],
    schema_version=1,
  })
end
