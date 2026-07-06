-- AUTO-GENERATED: OP11-025 / 이실리
-- rules_id=OP11-025 script_id=880001359 fingerprint=080db23d2a48a31770f10f9ecccc6e09258e3ebbba3668ea51bce63ba6deef8d
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP11-025]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=1000,
            duration=[[THIS_BATTLE]],
            op=[[MODIFY_POWER]],
            selector={
              count=1,
              kind=[[LEADER_OR_CHARACTER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={
          {
            count=1,
            op=[[REST_DON]],
          },
          {
            op=[[REST_SELF]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=true,
        source_text=[[【상대의 어택 시】【턴 1회】자신의 두웅!! 1장과 이 캐릭터를 레스트할 수 있다: 이번 배틀 동안, 자신의 리더 또는 캐릭터 1장까지의 파워 +1000.]],
        timings={
          [[ON_OPPONENT_ATTACK]],
        },
      },
    },
    keywords={},
    rules_id=[[OP11-025]],
    schema_version=1,
  })
end
