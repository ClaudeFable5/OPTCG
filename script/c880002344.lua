-- AUTO-GENERATED: OP15-042 / 퀴로스
-- rules_id=OP15-042 script_id=880002344 fingerprint=8d344596c103755a0d6b8dbaa7bd35ef37a4e05ae183b14137029ccabc0c4da8
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP15-042]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[THIS_TURN]],
            keyword=[[RUSH]],
            op=[[GAIN_KEYWORD]],
            selector={
              count=1,
              kind=[[SELF]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={
          {
            name=[[레베카]],
            op=[[LEADER_NAME_IS]],
            player=[[YOU]],
          },
        },
        costs={
          {
            count=1,
            op=[[TRASH_HAND]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 패 1장을 버릴 수 있다: 자신의 리더가 「레베카」인 경우, 이 캐릭터는 이번 턴 동안 【속공】을 얻는다.]],
        timings={
          [[ON_PLAY]],
        },
      },
      {
        actions={
          {
            op=[[ADD_SELF_TO_HAND]],
            player=[[YOU]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【KO 시】이 캐릭터 카드를 트래시에서 패에 넣는다.]],
        timings={
          [[ON_KO]],
        },
      },
    },
    keywords={},
    rules_id=[[OP15-042]],
    schema_version=1,
  })
end
