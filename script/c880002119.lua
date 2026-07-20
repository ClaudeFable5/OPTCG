-- AUTO-GENERATED: EB03-016 / 코즈키 히요리
-- rules_id=EB03-016 script_id=880002119 fingerprint=99b7b666975a7ab87352c10afb7de4132c0d1f20d6a676b1bc6da3083ce72c48
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[EB03-016]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            op=[[DRAW]],
            player=[[YOU]],
          },
        },
        conditions={
          {
            name=[[코즈키 오뎅]],
            op=[[LEADER_NAME_IS]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 리더가 「코즈키 오뎅」인 경우, 카드를 1장 뽑는다.]],
        timings={
          [[ON_PLAY]],
        },
      },
      {
        actions={
          {
            count=1,
            mode=[[UP_TO]],
            op=[[GIVE_DON]],
            selector={
              count=1,
              filter={
                trait=[[와노쿠니]],
              },
              kind=[[LEADER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
            state=[[RESTED]],
          },
        },
        conditions={},
        costs={
          {
            op=[[TRASH_SELF]],
          },
        },
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【기동: 메인】이 캐릭터를 트래시에 놓을 수 있다: 자신의 《와노쿠니》 특징을 가진 리더에게 레스트 상태인 두웅!!을 1장까지 부여한다.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[EB03-016]],
    schema_version=1,
  })
end
