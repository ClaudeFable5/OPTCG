-- MANUAL: OP17-044 / 캡틴 존 (2026-08-28 OP17 세계최강의 전사 추가)
-- JP 공홈 series 550117 기준, OP16 이식 방식 준수.
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP17-044]],
    compile_status=[[MANUAL]],
    effects={
      {
        actions={
          {
            attacker_player=[[OPPONENT]],
            duration=[[WHILE_CONDITION]],
            op=[[CANNOT_ATTACK_TARGETS]],
            target_filter={
              any={
                {
                  card_type=[[LEADER]],
                },
                {
                  card_type=[[CHARACTER]],
                  name_neq=[[캡틴 존]],
                },
              },
            },
          },
        },
        conditions={
          {
            op=[[LEADER_TRAIT_CONTAINS]],
            player=[[YOU]],
            trait=[[록스 해적단]],
          },
          {
            op=[[SELF_STATE_IS]],
            player=[[YOU]],
            state=[[RESTED]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[자신의 리더가 『록스 해적단』을 포함한 특징을 가지고 이 캐릭터가 레스트 상태인 경우, 상대는 캐릭터 「캡틴 존」 이외에 어택할 수 없다.]],
        timings={
          [[CONTINUOUS]],
        },
      },
      {
        actions={
          {
            count=1,
            op=[[DRAW]],
            player=[[YOU]],
          },
          {
            count=1,
            op=[[TRASH_HAND]],
            player=[[YOU]],
          },
        },
        conditions={},
        costs={
          {
            op=[[REST_SELF]],
          },
        },
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【기동 메인】이 캐릭터를 레스트로 할 수 있다：카드를 1장 뽑고, 자신의 패 1장을 버린다.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP17-044]],
    schema_version=1,
  })
end
