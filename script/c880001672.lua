-- AUTO-GENERATED: OP13-100 / 쥬얼리 보니
-- rules_id=OP13-100 script_id=880001672 fingerprint=7b425d4c05f14d62023bc16f97322da16aaf87645616f8db403520e17495478f
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP13-100]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=2,
            mode=[[UP_TO]],
            op=[[GIVE_DON]],
            selector={
              count=1,
              kind=[[LEADER_OR_CHARACTER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
            state=[[RESTED]],
          },
        },
        conditions={
          {
            op=[[YOUR_TURN]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=true,
        source_text=[[【자신의 턴 동안】【턴 1회】자신의 【트리거】를 가진 캐릭터가 등장했을 때, 발동할 수 있다. 자신의 리더 또는 캐릭터 1장에게 레스트 상태인 두웅!!을 2장까지 부여한다.]],
        timings={
          [[ON_OWN_TRIGGER_CHARACTER_PLAYED]],
        },
      },
    },
    keywords={},
    rules_id=[[OP13-100]],
    schema_version=1,
  })
end
