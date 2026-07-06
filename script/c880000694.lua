-- AUTO-GENERATED: OP05-081 / 외다리 병정
-- rules_id=OP05-081 script_id=880000694 fingerprint=f285e4fd0752bd8feae240e077c9f997111d494d1adf7111ebbb43e213c47e8e
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP05-081]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=-3,
            duration=[[THIS_TURN]],
            op=[[MODIFY_COST]],
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
            op=[[TRASH_SELF]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【기동: 메인】이 캐릭터를 트래시에 놓을 수 있다: 이번 턴 동안, 상대의 캐릭터 1장까지의 코스트 -3.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP05-081]],
    schema_version=1,
  })
end
