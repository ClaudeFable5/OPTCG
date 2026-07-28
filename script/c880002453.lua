-- AUTO-GENERATED: EB04-032 / 퀸
-- rules_id=EB04-032 script_id=880002453 fingerprint=24012de26c1cce823e2419da7b732c2c6b0abbe92a2adad1da2b641fc26cf4c3
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[EB04-032]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=2,
            op=[[DRAW]],
            player=[[YOU]],
          },
        },
        conditions={},
        costs={
          {
            count=1,
            filter={
              trait=[[백수 해적단]],
            },
            op=[[TRASH_HAND]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 패에서 《백수 해적단》 특징을 가진 카드 1장을 버릴 수 있다: 카드를 2장 뽑는다.]],
        timings={
          [[ON_PLAY]],
        },
      },
      {
        actions={
          {
            count=1,
            mode=[[UP_TO]],
            op=[[ADD_DON]],
            state=[[RESTED]],
          },
        },
        conditions={
          {
            op=[[LEADER_HAS_TRAIT]],
            player=[[YOU]],
            trait=[[백수 해적단]],
          },
        },
        costs={
          {
            count=2,
            op=[[REST_DON]],
          },
        },
        effect_id=[[E2]],
        once_per_turn=true,
        source_text=[[【기동: 메인】【턴 1회】자신의 두웅!! 2장을 레스트로 할 수 있다: 자신의 리더가 《백수 해적단》 특징을 가진 경우, 두웅!! 덱에서 두웅!! 1장까지를 레스트로 추가한다.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[EB04-032]],
    schema_version=1,
  })
end
